require 'facebook/messenger'

class NextMenstruationMessageWorker
  include Sidekiq::Worker
  include Facebook::Messenger

  def perform(user_facebook_id)
    user = User.find_by(facebook_id: user_facebook_id)

    days = (NextMenstruationDateCalculator.new(user).calculate - Date.today).to_i

    Bot.deliver(
      recipient: { id: user_facebook_id },
      message: {
        text: "Seu próximo ciclo se iniciará em #{days} dias #lembrete"
      }
    )
  end
end
