Rails.application.routes.draw do
  resources :customers
  devise_for :users
  resources :rooms do
    post "change_state", on: :collection
  end
  
  get "/available_rooms" => "rooms#available_rooms"

  root to: redirect('/rooms')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
