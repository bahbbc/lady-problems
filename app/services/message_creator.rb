require 'net/http'

class MessageCreator
  def initialize(user, message)
    @message = message
    @user = user
  end

  def build_message
    if send_reminders?
      AnticonceptionalMessageWorker.perform_in(40.seconds, @user.facebook_id)
      NextMenstruationMessageWorker.perform_in(1.minute, @user.facebook_id)
    end

    return dont_know_message if has_intents? && low_confidence_on_intents?
    return next_menstruation_message if pure_intent?
    return tampax_message if tampax?

    if multiple_choice.blank?
      { text: output_text }
    else
      message_with_buttons
    end
  end

  private


  def has_intents?
    !!query_conversation.dig('output', 'from_intent')
  end

  def low_confidence_on_intents?
    query_conversation.dig('intents', 0, 'confidence') < 0.70
  end

  def dont_know_message
    {
      text: <<-STR
Não entendi. Você pode me perguntar outras coisas como:
- O que fazer se você esqueceu de tomar o anticoncepcional;
- Que tipo de absorvente interno usar;
- Quando começa o seu próximo ciclo;
      STR
    }
  end

  def tampax_message
    { text: Tampax.new(@user).build_message }
  end

  def next_menstruation_message
    date = NextMenstruationDateCalculator.new(@user).calculate.strftime('%d/%m')
    { text: "Seu próximo ciclo começará por volta do dia #{date}." }
  end

  def tampax?
    query_conversation.dig('output', 'tampax')
  end

  def pure_intent?
    query_conversation.dig('output', 'pure_intent')
  end

  def send_reminders?
    query_conversation.dig('output', 'send_reminders')
  end

  def multiple_choice
    query_conversation.dig('output', 'multiple_choice')
  end

  def output_text
    query_conversation.dig('output', 'text')[0]
  end

  def query_conversation
    @query_conversation ||= @user.query_conversation(@message)
  end

  def message_with_buttons
    {
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: output_text,
          buttons: build_buttons
        }
      }
    }
  end

  def build_buttons
    multiple_choice.map do |btn|
      {
        type: 'postback',
        title: btn['text'],
        payload: "BUTTON #{btn['value']}"
      }
    end
  end
end
