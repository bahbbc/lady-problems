require "facebook/messenger"

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :message do |message|
  name = FacebookUserRetriever.new.name_by_sender_id(message.sender['id'])

  Bot.deliver(
    recipient: message.sender,
    message: {
      text: "Olá, #{name}! Que que #{message.text} significa?"
    }
  )
end