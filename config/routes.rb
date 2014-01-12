FinalProjectApp::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # get "welcome/index"
  root "career#index"
  resources :goals 
  devise_scope :user do
  	get 'sign_out', :to => 'devise/sessions#destroy'
  end 
  get '/users/:id/connections', :to => 'connections#index', :as => :user_connection
  # get '/connections/:id', :to => 'connections#show'
  resources :connections, only: [:new, :create, :show, :edit, :update] do 
    collection do 
      get 'search' 
    end 
  end 
end 



