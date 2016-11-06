require "facebook/messenger"

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :postback do |postback|
  facebook_user_retriever = FacebookUserRetriever.new(message.sender['id'])
  User.where(facebook_id: message.sender['id']).first_or_create(name: facebook_user_retriever.first_name)

  if postback.payload == 'NEW_THREAD_POSTBACK'
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "Olá, #{name}! Sou a Malina, vou te ajudar com seu ciclo menstrual and stuff! leroleroeleoroel asdasodhasodi asidh asidh asodh asdoihasodi hasdoiash doaisdhoasidhaosid asdoias"
      }
    )
  end
end
