require 'conversation'
require 'json'

class User < ApplicationRecord
  def initial_message
    query_conversation('')
  end

  def query_conversation(user_input)
    response = conversation.send_message(user_input)
    self.prev_conversation_context = response['context']

    response
  end

  private

  def conversation
    return @conversation if defined?(@conversation)

    if prev_conversation_context
      parsed_context = JSON.parse(prev_conversation_context)
    else
      parsed_context = nil
    end

    @conversation = Conversation.new(parsed_context)
  end
end
