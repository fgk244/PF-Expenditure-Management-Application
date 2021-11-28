Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "homes#top"
  get 'homes/about' => 'homes#about'

  resources :users
  resources :searches
  resources :payment_records do
     collection do
      get 'search'
     end
  end
  resources :categories
  resources :budgets

  get 'unsubscribe/:name' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/:name' => 'homes#withdraw', as: 'withdraw_user'
  put 'withdraw/:name' => 'users#withdraw'
  delete 'destroy_all', to: 'payment_records#destroy_all'



end
