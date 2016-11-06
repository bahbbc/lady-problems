require 'facebook/messenger'

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :message do |message|
  user = User.find_by(facebook_id: message.sender['id'])
  message_service = MessageCreator.new(user, message.text)

  if message.text == 'passou 1 dia'
    AnticonceptionalMessageWorker.perform_async(user.facebook_id)
  elsif message.text == 'passou 2 dias'
    NextMenstruationMessageWorker.perform_async(user.facebook_id)
  elsif message.text == 'passou 3 dias'
    DidYouMenstruateMessageWorker.perform_async(user.facebook_id)
  else
    Bot.deliver(
      recipient: message.sender,
      message: message_service.build_message
    )
  end
end
