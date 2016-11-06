require 'facebook/messenger'

class DidYouMenstruateMessageWorker
  include Sidekiq::Worker
  include Facebook::Messenger

  def perform(user_facebook_id)
    Bot.deliver(
      recipient: { id: user_facebook_id },
      message: {
        attachment: {
          type: 'template',
          payload: {
            template_type: 'button',
            text: 'Você menstruou hoje?',
            buttons: [
              { type: 'postback', title: 'Sim', payload: 'I_MENSTRUATED_TODAY' },
              { type: 'postback', title: 'Não', payload: 'I_DIDNT_MENSTRUATED_TODAY' }
            ]
          }
        }
      }
    )
  end
end
