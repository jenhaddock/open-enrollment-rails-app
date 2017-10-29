Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'

  root to: 'users#homepage'
  resources :users

  #get '/sign_in' => 'sessions#new'
  #post '/sign_in' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :dependent_deduction_details
  resources :deduction_details
  resources :dependents
  resources :deductions

end
