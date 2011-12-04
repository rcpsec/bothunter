Telefront::Application.routes.draw do

  resources :profiles

  resources :groups

  resources :campaigns

  resources :pages

  devise_for :users

  resources :users do
    resources :manual_invoices
  end
  
  root :to => "pages#index"

end
