require 'conversation'
require 'json'

class User < ApplicationRecord
  def initial_message
    query_conversation('')
  end

  def query_conversation(user_input)
    response = conversation.send_message(user_input)
    self.prev_conversation_context = response['context']

    updated_user = response['context']['user']
    if updated_user
      assign_attributes(updated_user.slice(*attribute_names))
      save
    end

    response
  end

  private

  def conversation
    return @conversation if defined?(@conversation)

    if prev_conversation_context
      parsed_context = JSON.parse(prev_conversation_context)
    else
      parsed_context = {}
    end

    @conversation = Conversation.new(parsed_context.merge(user_context))
  end

  def user_context
    {
      user: {
        new: true,
        name: name,
      }
    }
  end
end
