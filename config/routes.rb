Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'
  
  root to: 'users#homepage'
  resources :users

  resources :dependent_deduction_details
  resources :deduction_details
  resources :dependents
  resources :deductions

end
