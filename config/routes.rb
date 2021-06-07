Rails.application.routes.draw do
  root 'courses#index'

  resources :courses do
    resources :plans
    resources :assign_students, only: [:index, :update]
  end
  resources :teachers
  resources :students

  resources :search_courses, only: [:index, :new]
end
