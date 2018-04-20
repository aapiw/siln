Rails.application.routes.draw do
  resources :extension_of_tasks
  resources :sks
  resources :sk_submissions
  resources :extension_submissions
  resources :teachers
 	resources :schools
 	
 	scope :users do
  	devise_for :schools, controllers: { sessions: 'users/sessions' }
  end

  devise_scope :school do
	  authenticated :school do
	    root "passthrough#index", as: :signed_in_root
	  end
  	root to: "users/sessions#new"
	end
end
