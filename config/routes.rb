Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '/api/v1' do
    resources :users
    resources :waits
    get '/waits/:user_id/:waiting_for_id', to: 'waits#create'
  end
end