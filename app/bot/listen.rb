require "facebook/messenger"

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :message do |message|
  Bot.deliver(
    recipient: message.sender,
    message: {
      text: "Olá, #{name}! Que que #{message.text} significa?"
    }
  )
end
