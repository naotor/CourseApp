Rails.application.routes.draw do
  root 'search_courses#new'

  resources :courses do
    resources :plans
    resources :assign_students, only: [:index, :update]
  end
  resources :teachers
  resources :students

  resources :search_courses, only: [:index, :new]
end
