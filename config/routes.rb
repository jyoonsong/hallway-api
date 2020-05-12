Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources: :sessions

  scope '/api/v1' do
    resources :users
    resources :waits
    
    post '/waits/:is_waited_id', to: 'waits#create'
    delete '/waits/:is_waited_id', to: 'waits#destroy'
  end
end