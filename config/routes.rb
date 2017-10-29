Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'

  root to: 'users#homepage'
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/signup' => 'sessions#new'
  post '/signup' => 'sessions#create'

  resources :dependent_deduction_details
  resources :deduction_details
  resources :dependents
  resources :deductions

end
