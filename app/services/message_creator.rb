require 'net/http'

class MessageCreator
  def initialize(user, message)
    @message = message
    @user = user
  end

  def message
    "#{@user.name}: #{@message.text}"
  end

  def buttons
    [
      { type: 'postback', title: 'Siiiim', payload: 'YES' },
      { type: 'postback', title: 'Nops', payload: 'NO' },
      { type: 'postback', title: 'Se pá', payload: 'MAYBE' }
    ]
  end
end
