Rails.application.routes.draw do
  root 'courses#index'

  resources :courses do
    resources :plans
  end
  resources :teachers
  resources :students
end
