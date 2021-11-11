Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root :to => "homes#top"
  get 'homes/about' => 'homes#about'

  resources :users
  resources :searches
  resources :payment_records
  resources :categories
  resources :budgets

  delete 'destroy_all', to: 'payment_records#destroy_all'


end
