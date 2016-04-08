Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]


  resources :shifts do
    resources :offers, only: [:create]
  end

  post 'texts', to: 'get_texts#get_text'

  root 'shifts#index'
end
