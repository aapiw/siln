class PassthroughController < ApplicationController
  def index
    path = case current_school.admin
      when true
        schools_path
      when false
        teachers_path
      else
        # If you want to raise an exception or have a default root for users without roles
    end

    redirect_to path     
  end
end