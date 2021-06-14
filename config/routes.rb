Rails.application.routes.draw do
  root to: 'application#index'
  
  resources :gardens, only: [ :index, :show ] do
    resources :plots, only: :index do
      resources :plants, only: [] do
        member do
          post :remove_plant
        end
      end
    end
  end
end
