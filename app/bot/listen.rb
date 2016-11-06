require 'facebook/messenger'

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :message do |message|
  user = User.find_by(facebook_id: message.sender['id'])
  message_service = MessageCreator.new(user, message)

  Bot.deliver(
    recipient: message.sender,
    message: {
      attachment: {
        type: 'template',
        payload: {
          template_type: 'button',
          text: message_service.message,
          buttons: message_service.buttons
        }
      }
    }
  )
  AnticonceptionalMessageWorker.perform_in(15.seconds, user.facebook_id)
end
