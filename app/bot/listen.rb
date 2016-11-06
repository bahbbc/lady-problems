require 'facebook/messenger'

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :message do |message|
  user = User.find_by(facebook_id: message.sender['id'])
  message_service = MessageCreator.new(user, message.text)

  Bot.deliver(
    recipient: message.sender,
    message: message_service.build_message
  )
  # AnticonceptionalMessageWorker.perform_in(3.seconds, user.facebook_id)
  # NextMenstruationMessageWorker.perform_in(5.seconds, user.facebook_id)
end
