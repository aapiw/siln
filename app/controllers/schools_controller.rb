class SchoolsController < ApplicationController
	  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.default
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    if params[:year].present?
      # @teachers = @school.teachers.includes(:sks).where(sks:{year:params[:year]})
      # @teachers = @school.teachers.includes(:sks, :extension_of_tasks).where(sks:{year:params[:year]}, extension_of_tasks:{year:params[:year]})
      @teachers = @school.teachers.includes(:sks).where(sks:{year:params[:year]})
      @teachers = @school.teachers.includes(:extension_of_tasks).where(extension_of_tasks:{year:params[:year]}) unless @teachers.present?
    else
      @teachers = @school.teachers.includes(:sks, :extension_of_tasks)
    end
    # respond_to do |format|
    #   format.js
    #   format.html
    # end
    # render json: @teachers_based_on_year.map {|ext| [ ext.teacher.name, ext.id ] }
    
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to schools_url, notice: 'Sekolah berhasil dibuat.' }
      else
        format.html { render :new }
        flash["alert"] = @school.errors.full_messages
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        sign_in(@school, :bypass => true)
        format.html { redirect_to schools_path, notice: 'Sekolah berhasil diubah.' }
      else
        format.html { render :edit }
        flash["alert"] = @school.errors.full_messages
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'Sekolah berhasil dihapus.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:username, :email, :password, :name, :country_id, :responsible_school, :phone)
    end
end
