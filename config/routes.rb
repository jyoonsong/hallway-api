Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/api/v1' do
    resources :users
    resources :waits

    get '/waited_by_users', to: 'users#waited_by_users'
    
    post '/waits/:is_waited_id', to: 'waits#create'
    delete '/waits/:is_waited_id', to: 'waits#destroy'

    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/logged_in', to: 'sessions#is_logged_in?'
  end
end