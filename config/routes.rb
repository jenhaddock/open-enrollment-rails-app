Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'
  get '/users/summary' => 'users#summary'
  get '/users/:id/getTotal' => 'users#getTotal'
  get '/users/deductions' => 'deductions#index'

  root to: 'users#homepage'
  resources :users do
    resources :dependents
    resources :deduction_details
  end

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/signup' => 'sessions#new'
  post '/signup' => 'sessions#create'
  post '/deduction_details' => 'deduction_details#update'

  resources :deductions

  get '/dependents/:id/destroy', to: 'dependents#destroy'

end
