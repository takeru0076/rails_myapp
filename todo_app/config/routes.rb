Rails.application.routes.draw do
  resources :todos
  resources :todo_counts, only: [:index]
  #root to: "users#index"
  devise_for :users
  root 'home#top'
  get "up" => "rails/health#show", as: :rails_health_check
end
