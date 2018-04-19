Rails.application.routes.draw do
  root "teachers#index"
  resources :extension_of_tasks
  resources :sks
  resources :sk_submissions
  resources :extension_submissions
  # devise_for :schools
  resources :teachers
  devise_for :schools, controllers: { sessions: 'schools/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
