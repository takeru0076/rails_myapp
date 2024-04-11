Rails.application.routes.draw do
  get 'home/top'
  get 'hello/index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
