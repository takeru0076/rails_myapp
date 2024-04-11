Rails.application.routes.draw do
  root 'home#top'
  get 'hello/index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
