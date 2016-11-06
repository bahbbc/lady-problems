require 'net/http'

class MessageCreator
  def initialize(user, message)
    @message = message
    @user = user
  end

  def build_message
    if send_reminders?
      AnticonceptionalMessageWorker.perform_in(15.seconds, @user.facebook_id)
      NextMenstruationMessageWorker.perform_in(30.seconds, @user.facebook_id)
    end

    if multiple_choice.blank?
      { text: output_text }
    else
      message_with_buttons
    end
  end

  private

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
