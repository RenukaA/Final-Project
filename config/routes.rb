FinalProjectApp::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # get "welcome/index"
  root "career#index"
  resources :goals  
  get '/auth/:provider/callback', to: 'sessions#create'
end
