Rails.application.routes.draw do
  root to: 'application#index'
  
  resources :gardens, only: [] do
    resources :plots, only: :index
  end
end
