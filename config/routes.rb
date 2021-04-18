Rails.application.routes.draw do
  resources :rooms do
    post "change_state", on: :collection
  end
  resources :documentations
  root to: redirect('/documentations')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
