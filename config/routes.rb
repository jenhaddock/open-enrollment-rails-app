Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'

  resources :dependent_deduction_details
  resources :deduction_details
  resources :dependents
  resources :deductions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
