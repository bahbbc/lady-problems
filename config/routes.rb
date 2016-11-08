Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    get '/health-check', to: 'health_check#index'
    mount Facebook::Messenger::Server, at: "bot"
  end
end
