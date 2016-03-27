Rails.application.routes.draw do
  resources :users do
    resources :shifts
  end
end
