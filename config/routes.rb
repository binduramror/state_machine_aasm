Rails.application.routes.draw do
  devise_for :users
  resources :rooms do
    post "change_state", on: :collection
  end
  root to: redirect('/rooms')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
