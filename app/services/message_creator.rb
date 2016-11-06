require 'net/http'

class MessageCreator
  def initialize(user, message)
    @message = message
    @user = user
  end

  def message
    @user.query_conversation(@message.text).dig('output', 'text')[0]
  end

  def buttons
    [
    ]
  end
end
