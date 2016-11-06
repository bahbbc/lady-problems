require "facebook/messenger"

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :postback do |postback|
  name =  FacebookUserRetriever.new(postback.sender['id']).first_name

  if postback.payload == 'NEW_THREAD_POSTBACK'
    Bot.deliver(
      recipient: message.sender,
      message: {
        text: "Olá, #{name}! Sou a Malina, vou te ajudar com seu ciclo menstrual and stuff! leroleroeleoroel asdasodhasodi asidh asidh asodh asdoihasodi hasdoiash doaisdhoasidhaosid asdoias"
      }
    )
  end
end