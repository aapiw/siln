class ApplicationController < ActionController::Base
  # load_and_authorize_resource

  protect_from_forgery with: :exception
  before_action :authenticate_school!
  before_action :clear_flash, only: [:new]
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def current_ability
    @current_ability ||= Ability.new(current_school)
  end

  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:alert]  = "Anda tidak mempunyai otoritas untuk mengakses halaman tersebut."
  #   respond_to do |format|
  #     format.html { redirect_to root_path }
  #   end
  # end

  private
  
    def clear_flash
      flash.clear unless controller_name == "sessions"
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
