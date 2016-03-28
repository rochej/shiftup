Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]

  resources :users do
    resources :shifts
  end

  root 'shifts#index'
end
