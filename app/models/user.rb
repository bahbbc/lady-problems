require 'conversation'
require 'json'

class User < ApplicationRecord
  def initial_message
    query_conversation('')
  end

  def query_conversation(user_input)
    response = conversation.send_message(user_input)
    self.prev_conversation_context = JSON.dump(response['context'])

    updated_user = response.dig('context', 'user')
    if updated_user
      assign_attributes(updated_user.slice(*attribute_names, 'last_menstruation_day', 'last_menstruation_month'))
      save
    end

    response
  end

  def last_menstruation_day=(value)
    @last_menstruation_day = value.to_i

    if @last_menstruation_month
      self.menstruation_date = Date.new(2016, @last_menstruation_month, @last_menstruation_day)
    end
  end

  def last_menstruation_month=(value)
    @last_menstruation_month = value.to_i

    if @last_menstruation_day
      self.menstruation_date = Date.new(2016, @last_menstruation_month, @last_menstruation_day)
    end
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
