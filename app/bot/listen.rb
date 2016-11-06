require 'facebook/messenger'

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :message do |message|
  user = User.find_by(facebook_id: message.sender['id'])
  message_service = MessageCreator.new(user, message.text)

  if message.text == '#tempo1'
    AnticonceptionalMessageWorker.perform_async(user.facebook_id)
  elsif message.text == '#tempo2'
    NextMenstruationMessageWorker.perform_async(user.facebook_id)
  elsif message.text == '#tempo3'
    DidYouMenstruateMessageWorker.perform_async(user.facebook_id)
  else
    Bot.deliver(
      recipient: message.sender,
      message: message_service.build_message
    )
  end
end
