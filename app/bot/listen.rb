require 'facebook/messenger'

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :message do |message|
  name = FacebookUserRetriever.new.name_by_sender_id(message.sender['id'])
  message_service = MessageCreator.new(name, message)

  Bot.deliver(
    recipient: message.sender,
    message: {
      text: message_service.message,
      buttons: message_service.buttons
    }
  )
end
