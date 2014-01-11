FinalProjectApp::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # get "welcome/index"
  root "career#index"
  resources :goals
  devise_scope :user do
  	get 'sign_out', :to => 'devise/sessions#destroy'
  end 
  get '/users/:id/connections', :to => 'connections#index', :as => :user_connection

end 



