Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    post "edit"
  end

  root "posts#index"
end
