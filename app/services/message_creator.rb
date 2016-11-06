require 'net/http'

class MessageCreator
  def initialize(name, message)
    @message = message
    @name = name
  end

  def message
    "#{@name}: #{@message.text}"
  end

  def buttons
    [
      { type: 'postback', title: 'Siiiim', payload: 'YES' },
      { type: 'postback', title: 'Nops', payload: 'NO' },
      { type: 'postback', title: 'Se pá', payload: 'MAYBE' }
    ]
  end
end
