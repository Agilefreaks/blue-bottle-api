Rails.application.routes.draw do
  namespace :v1 do
    resources :docs, only: %i[index]
    resources :coffee_shops, only: [:index]
    resources :tokens, only: [:create]
  end
end
