require 'facebook/messenger'

class AnticonceptionalMessageWorker
  include Sidekiq::Worker
  include Facebook::Messenger

  def perform(user_facebook_id)
    Bot.deliver(
      recipient: { id: user_facebook_id },
      message: {
        text: 'Não se esqueça de tomar o seu anticoncepcional hoje! #lembrete'
      }
    )
  end
end
