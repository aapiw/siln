Rails.application.routes.draw do
  resources :extension_of_tasks, except:[:new, :edit]
  
  resources :sk_submissions do #, except:[:new, :edit]
    member do
      get 'teachers_based_on_year/:year' => :teachers_based_on_year, as: :teachers_based_on_year
    end 
  end
  resources :extension_submissions#, except:[:new, :edit]
  resources :sks, except:[:new, :edit]

  resources :teachers do
    resources :sks, only:[:new, :edit]
    resources :extension_of_tasks, only:[:new, :edit]
  end
  resources :schools do
    resources :sk_submissions#, only:[:new, :edit]
    resources :extension_submissions
  end
 	
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
