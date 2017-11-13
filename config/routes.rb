Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'

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

  resources :deductions

  get '/dependents/:id/destroy', to: 'dependents#destroy'

end
