Rails.application.routes.draw do
  resources :teachers
  # devise_for :schools, controllers: { sessions: 'schools/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
