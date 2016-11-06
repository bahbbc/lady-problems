require "facebook/messenger"

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :message do |message|
  facebook_user_retriever = FacebookUserRetriever.new(message.sender['id'])
  User.where(facebook_id: message.sender['id']).first_or_create(name: facebook_user_retriever.first_name,
    last_name: facebook_user_retriever.last_name)

  Bot.deliver(
    recipient: message.sender,
    message: {
      text: "Olá, #{name}! Que que #{message.text} significa?"
    }
  )
end
