require 'facebook/messenger'

class AnticonceptionalMessageWorker
  include Sidekiq::Worker
  include Facebook::Messenger

  def perform
    User.where(anticonpectional_hour: Time.now.hour).each do |user|
      Bot.deliver(
        recipient: { id: user.facebook_id },
        message: {
          text: 'Noes'
        }
      )
    end

    perform_in(1.hour)
  end
end
