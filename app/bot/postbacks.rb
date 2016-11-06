require 'facebook/messenger'

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :postback do |postback|
  facebook_user_retriever = FacebookUserRetriever.new(postback.sender['id'])
  user = User.where(facebook_id: postback.sender['id']).first_or_create(name: facebook_user_retriever.first_name)

  payload = postback.payload.split(' ')

  if payload.first == 'NEW_THREAD_POSTBACK'
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: user.initial_message.dig('output', 'text')[0]
      }
    )
  elsif payload.first == 'BUTTON'
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: MessageCreator.new(user, payload.last)
      }
    )
  end
end
