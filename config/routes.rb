Rails.application.routes.draw do
  resources :extension_of_tasks
  resources :sks
  resources :sk_submissions
  resources :extension_submissions
  # devise_for :schools
  resources :teachers
  resources :schools
  devise_for :schools, controllers: { sessions: 'schools/sessions' }

  devise_scope :school do
	  authenticated :school do
	    root "passthrough#index", as: :signed_in_root
	  end
  	# root to: "schools/sessions#new"
	end


  # root :to => "schools/sessions#new"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
