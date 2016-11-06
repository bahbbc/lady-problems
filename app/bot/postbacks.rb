require 'facebook/messenger'

include Facebook::Messenger
Facebook::Messenger::Subscriptions.subscribe

Bot.on :postback do |postback|
  facebook_user_retriever = FacebookUserRetriever.new(postback.sender['id'])
  user = User.where(facebook_id: postback.sender['id']).first_or_create(name: facebook_user_retriever.first_name)

  if postback.payload == 'NEW_THREAD_POSTBACK'
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: "Olá, #{user.name}! Sou a Malina, vou te ajudar com seu ciclo menstrual and stuff! leroleroeleoroel asdasodhasodi asidh asidh asodh asdoihasodi hasdoiash doaisdhoasidhaosid asdoias"
      }
    )
  elsif postback.payload == 'YES'
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: 'Noes'
      }
    )
  elsif postback.payload == 'NO'
    Bot.deliver(
      recipient: postback.sender,
      message: {
        text: 'Poxa, vida'
      }
    )
  elsif postback.payload == 'MAYBE'
    Bot.deliver(
      recipient: postback.sender,
      message: {
        attachment: {
          type: 'template',
          payload: {
            template_type: 'button',
            text: 'Decide aí, tio',
            buttons: [
              { type: 'postback', title: 'Siiiim', payload: 'YES' },
              { type: 'postback', title: 'Nops', payload: 'NO' }
            ]
          }
        }
      }
    )
  end
end
