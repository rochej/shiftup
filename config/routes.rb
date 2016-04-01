Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]


  resources :shifts do
    resources :offers, only: [:create]
  end

  root 'shifts#index'
end
