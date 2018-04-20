class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_school!
  before_action :clear_flash, only: [:new]
  # before_action :configure_permitted_parameters, if: :devise_controller?



  private
  
    def clear_flash
      flash.clear  
    end
  # def after_sign_out_path_for(resource_or_scope)
  #   if resource_or_scope == :user
  #     root_path
  #   elsif resource_or_scope == :admin
  #     new_admin_session_path
  #   else
  #     root_path
  #   end
  # end

  # def configure_permitted_parameters
  # 	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :dob, :country_id, :admin_id, :display_password, :sign_up, :country_live_id, :kind_of_contest] )
  # end

end
