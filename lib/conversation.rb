require 'faraday'
require 'json'

class Conversation
  def initialize
    workspace_id = ENV.fetch('WORKSPACE_ID')
    @connection = Faraday.new(
      url: "https://gateway.watsonplatform.net/conversation/api/v1/workspaces/#{workspace_id}/message?version=2016-09-20",
      headers: {
        'Content-Type' => 'application/json'
      },
    )

    username = ENV.fetch('CONVERSATION_USERNAME')
    password = ENV.fetch('CONVERSATION_PASSWORD')
    @connection.basic_auth(username, password)
  end

  def send_message(user_input = '')
    body = {
      input: { text: user_input },
      context: {},
    }

    if defined?(@prev_context)
      body[:context] = @prev_context
    end

    response = @connection.post do |req|
      req.body = body.to_json
    end

    body = JSON.parse(response.body)
    @prev_context = body['context']

    body
  end
end
