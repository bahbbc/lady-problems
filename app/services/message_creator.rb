require 'net/http'

class MessageCreator
  def initialize(user, message)
    @message = message
    @user = user
  end

  def build_message
    if multiple_choice.blank?
      { text: output_text }
    else
      message_with_buttons
    end
  end

  private

  def multiple_choice
    query_conversation.dig('context', 'multiple_choice')
  end

  def output_text
    query_conversation.dig('output', 'text')[0]
  end

  def query_conversation
    @query_conversation ||= @user.query_conversation(@message.text)
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
