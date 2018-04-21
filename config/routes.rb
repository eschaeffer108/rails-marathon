Rails.application.routes.draw do
  root 'houses#index'
  resources :houses do
    resources :members
  end 
end
