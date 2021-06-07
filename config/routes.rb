Rails.application.routes.draw do
  root 'courses#index'

  resources :courses do
    resources :plans, expect: [:index, :show]
  end
  resources :teachers
  resources :students
end
