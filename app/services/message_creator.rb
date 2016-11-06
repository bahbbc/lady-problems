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

    return intent_text if pure_intent?

    if multiple_choice.blank?
      { text: output_text }
    else
      message_with_buttons
    end
  end

  private

  def intent_text
    date = NextMenstruationDateCalculator.new(user).calculate.strftime('%d/%m')
    { text: "Seu próximo ciclo começará por volta do dia #{date}." }
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
