require 'facebook/messenger'

class NextMenstruationMessageWorker
  include Sidekiq::Worker
  include Facebook::Messenger

  def perform(user_facebook_id)
    user = User.find_by(facebook_id: user_facebook_id)

    next_menstruation_date = NextMenstruationDateCalculator.new(user).calculate

    Bot.deliver(
      recipient: { id: user_facebook_id },
      message: {
        text: "Seu próximo ciclo se iniciará por volta do dia #{next_menstruation_date}"
      }
    )
  end
end
