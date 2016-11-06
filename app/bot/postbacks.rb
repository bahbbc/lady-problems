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
      message: MessageCreator.new(user, payload.last).build_message
    )
  elsif payload.first == 'I_MENSTRUATED_TODAY'
    user.menstruation_date = Date.today
    user.save

    Bot.deliver(
      recipient: postback.sender,
      message: { text: 'Dados atualizados com sucesso!' }
    )
  elsif payload.first == 'I_DIDNT_MENSTRUATED_TODAY'
    Bot.deliver(
      recipient: postback.sender,
      message: { text: 'Sua menstruação deve estar perto, perguntaremos de novo amanhã!' }
    )
  end
end
