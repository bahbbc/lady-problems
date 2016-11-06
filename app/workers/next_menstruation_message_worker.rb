require 'facebook/messenger'

class NextMenstruationMessageWorker
  include Sidekiq::Worker
  include Facebook::Messenger

  def perform(user_facebook_id)
    user = User.find_by(facebook_id: facebook_id)

    Bot.deliver(
      recipient: { id: user_facebook_id },
      message: {
        text: 'Não se esqueça de tomar o seu anticoncepcional hoje!'
      }
    )
  end
end
