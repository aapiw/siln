# == Route Map
#
#                                      Prefix Verb   URI Pattern                                                       Controller#Action
#                          extension_of_tasks GET    /extension_of_tasks(.:format)                                     extension_of_tasks#index
#                                             POST   /extension_of_tasks(.:format)                                     extension_of_tasks#create
#                           extension_of_task GET    /extension_of_tasks/:id(.:format)                                 extension_of_tasks#show
#                                             PATCH  /extension_of_tasks/:id(.:format)                                 extension_of_tasks#update
#                                             PUT    /extension_of_tasks/:id(.:format)                                 extension_of_tasks#update
#                                             DELETE /extension_of_tasks/:id(.:format)                                 extension_of_tasks#destroy
#        teachers_based_on_year_sk_submission GET    /sk_submissions/:id/teachers_based_on_year/:year(.:format)        sk_submissions#teachers_based_on_year
#                              sk_submissions GET    /sk_submissions(.:format)                                         sk_submissions#index
#                                             POST   /sk_submissions(.:format)                                         sk_submissions#create
#                           new_sk_submission GET    /sk_submissions/new(.:format)                                     sk_submissions#new
#                          edit_sk_submission GET    /sk_submissions/:id/edit(.:format)                                sk_submissions#edit
#                               sk_submission GET    /sk_submissions/:id(.:format)                                     sk_submissions#show
#                                             PATCH  /sk_submissions/:id(.:format)                                     sk_submissions#update
#                                             PUT    /sk_submissions/:id(.:format)                                     sk_submissions#update
#                                             DELETE /sk_submissions/:id(.:format)                                     sk_submissions#destroy
# teachers_based_on_year_extension_submission GET    /extension_submissions/:id/teachers_based_on_year/:year(.:format) extension_submissions#teachers_based_on_year
#                       extension_submissions GET    /extension_submissions(.:format)                                  extension_submissions#index
#                                             POST   /extension_submissions(.:format)                                  extension_submissions#create
#                    new_extension_submission GET    /extension_submissions/new(.:format)                              extension_submissions#new
#                   edit_extension_submission GET    /extension_submissions/:id/edit(.:format)                         extension_submissions#edit
#                        extension_submission GET    /extension_submissions/:id(.:format)                              extension_submissions#show
#                                             PATCH  /extension_submissions/:id(.:format)                              extension_submissions#update
#                                             PUT    /extension_submissions/:id(.:format)                              extension_submissions#update
#                                             DELETE /extension_submissions/:id(.:format)                              extension_submissions#destroy
#                                         sks GET    /sks(.:format)                                                    sks#index
#                                             POST   /sks(.:format)                                                    sks#create
#                                          sk GET    /sks/:id(.:format)                                                sks#show
#                                             PATCH  /sks/:id(.:format)                                                sks#update
#                                             PUT    /sks/:id(.:format)                                                sks#update
#                                             DELETE /sks/:id(.:format)                                                sks#destroy
#                              new_teacher_sk GET    /teachers/:teacher_id/sks/new(.:format)                           sks#new
#                             edit_teacher_sk GET    /teachers/:teacher_id/sks/:id/edit(.:format)                      sks#edit
#               new_teacher_extension_of_task GET    /teachers/:teacher_id/extension_of_tasks/new(.:format)            extension_of_tasks#new
#              edit_teacher_extension_of_task GET    /teachers/:teacher_id/extension_of_tasks/:id/edit(.:format)       extension_of_tasks#edit
#                                    teachers GET    /teachers(.:format)                                               teachers#index
#                                             POST   /teachers(.:format)                                               teachers#create
#                                 new_teacher GET    /teachers/new(.:format)                                           teachers#new
#                                edit_teacher GET    /teachers/:id/edit(.:format)                                      teachers#edit
#                                     teacher GET    /teachers/:id(.:format)                                           teachers#show
#                                             PATCH  /teachers/:id(.:format)                                           teachers#update
#                                             PUT    /teachers/:id(.:format)                                           teachers#update
#                                             DELETE /teachers/:id(.:format)                                           teachers#destroy
#                       school_sk_submissions GET    /schools/:school_id/sk_submissions(.:format)                      sk_submissions#index
#                                             POST   /schools/:school_id/sk_submissions(.:format)                      sk_submissions#create
#                    new_school_sk_submission GET    /schools/:school_id/sk_submissions/new(.:format)                  sk_submissions#new
#                   edit_school_sk_submission GET    /schools/:school_id/sk_submissions/:id/edit(.:format)             sk_submissions#edit
#                        school_sk_submission GET    /schools/:school_id/sk_submissions/:id(.:format)                  sk_submissions#show
#                                             PATCH  /schools/:school_id/sk_submissions/:id(.:format)                  sk_submissions#update
#                                             PUT    /schools/:school_id/sk_submissions/:id(.:format)                  sk_submissions#update
#                                             DELETE /schools/:school_id/sk_submissions/:id(.:format)                  sk_submissions#destroy
#                school_extension_submissions GET    /schools/:school_id/extension_submissions(.:format)               extension_submissions#index
#                                             POST   /schools/:school_id/extension_submissions(.:format)               extension_submissions#create
#             new_school_extension_submission GET    /schools/:school_id/extension_submissions/new(.:format)           extension_submissions#new
#            edit_school_extension_submission GET    /schools/:school_id/extension_submissions/:id/edit(.:format)      extension_submissions#edit
#                 school_extension_submission GET    /schools/:school_id/extension_submissions/:id(.:format)           extension_submissions#show
#                                             PATCH  /schools/:school_id/extension_submissions/:id(.:format)           extension_submissions#update
#                                             PUT    /schools/:school_id/extension_submissions/:id(.:format)           extension_submissions#update
#                                             DELETE /schools/:school_id/extension_submissions/:id(.:format)           extension_submissions#destroy
#                                     schools GET    /schools(.:format)                                                schools#index
#                                             POST   /schools(.:format)                                                schools#create
#                                  new_school GET    /schools/new(.:format)                                            schools#new
#                                 edit_school GET    /schools/:id/edit(.:format)                                       schools#edit
#                                      school GET    /schools/:id(.:format)                                            schools#show
#                                             PATCH  /schools/:id(.:format)                                            schools#update
#                                             PUT    /schools/:id(.:format)                                            schools#update
#                                             DELETE /schools/:id(.:format)                                            schools#destroy
#                          new_school_session GET    /users/schools/sign_in(.:format)                                  users/sessions#new
#                              school_session POST   /users/schools/sign_in(.:format)                                  users/sessions#create
#                      destroy_school_session DELETE /users/schools/sign_out(.:format)                                 users/sessions#destroy
#                              signed_in_root GET    /                                                                 passthrough#index
#                                        root GET    /                                                                 users/sessions#new

Rails.application.routes.draw do
  resources :extension_of_tasks, except:[:new, :edit]
  
  resources :sk_submissions do #, except:[:new, :edit]
    member do
      get 'teachers_based_on_year/:year' => :teachers_based_on_year, as: :teachers_based_on_year
    end 
  end
  
  resources :extension_submissions do #, except:[:new, :edit]
    member do
      get 'teachers_based_on_year/:year' => :teachers_based_on_year, as: :teachers_based_on_year
    end 
  end
  
  resources :sks, except:[:new, :edit]

  resources :teachers do
    resources :sks, only:[:new, :edit]
    resources :extension_of_tasks, only:[:new, :edit]
  end
  resources :schools do
    # get :teachers_based_year
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
