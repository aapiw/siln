class ExtensionSubmissionsController < ApplicationController
  before_action :set_school
  before_action :set_extension_submission, only: [:show, :edit, :update, :destroy, :teachers_based_on_year]
  before_action :set_teachers_based_on_year, only:[:new, :edit, :update]

  # GET /extension_submissions
  # GET /extension_submissions.json
  def index
    if current_school.admin
      @extension_submissions = ExtensionSubmission.all
    else
      @extension_submissions = current_school.extension_submissions
    end
    
  end

  # GET /extension_submissions/1
  # GET /extension_submissions/1.json
  def show
  end

  # GET /extension_submissions/new
  def new
    @extension_submission = ExtensionSubmission.new
  end

  # GET /extension_submissions/1/edit
  def edit
  end

  # POST /extension_submissions
  # POST /extension_submissions.json
  def create
    # extension_submission_params2 = extension_submission_params
    # extension_submission_params2["recent_extention"].reject!(&:blank?)

    @extension_submission = ExtensionSubmission.new(extension_submission_params)

    respond_to do |format|
      if @extension_submission.save
        format.html { redirect_to extension_submissions_path, notice: 'Permohonan perpanjanganberhasil dibuat.' }
      else
        format.html { render :new }
        flash["alert"] = @extension_submission.errors.full_messages
      end
    end
  end

  # PATCH/PUT /extension_submissions/1
  # PATCH/PUT /extension_submissions/1.json
  def update
    # extension_submission_params2 = extension_submission_params
    # extension_submission_params2["recent_extention"].reject!(&:blank?)
    respond_to do |format|
      if @extension_submission.update(extension_submission_params)
        format.html { redirect_to extension_submissions_path, notice: 'Permohonan perpanjangan berhasil diperbarui.' }
      else
        format.html { render :edit }
        flash["alert"] = @extension_submission.errors.full_messages
      end
    end
  end

  # DELETE /extension_submissions/1
  # DELETE /extension_submissions/1.json
  def destroy
    @extension_submission.destroy
    respond_to do |format|
      format.html { redirect_to extension_submissions_url, notice: 'Permohonan perpanjangan berhasil dihapus.' }
    end
  end

  def teachers_based_on_year
    extensionOfTask = ExtensionOfTask.where(approved_by_admin:true) if current_school.admin
    extensionOfTask = ExtensionOfTask
    @teachers_based_on_year = extensionOfTask.show_teachers_based_year(@school.teachers.pluck(:id), params[:year])  
    render json: @teachers_based_on_year.map {|ext| [ ext.teacher.name, ext.id ] }
  end

  private
    def set_teachers_based_on_year
      extensionOfTask = ExtensionOfTask
      extensionOfTask = ExtensionOfTask.where(approved_by_admin:true) if current_school.admin
      year = @sk_submission ? @sk_submission.year : params[:year]
      @teachers_based_on_year = extensionOfTask.show_teachers_based_year(@school.teachers.pluck(:id), year.to_s)
      # @teachers_based_on_year = [nil, nil] if @teachers_based_on_year.blank?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_school
      if params[:school_id]
        params_school = params[:school_id]
      else
        params_school = params[:extension_submission][:school_id] if params[:extension_submission]
      end

      if params_school
        if current_school.admin
          @school = School.find(params_school) 
        else
          @school = current_school
        end
      else
          @school = current_school
      end
    end
    
    def set_extension_submission
      @extension_submission = ExtensionSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extension_submission_params
      params.require(:extension_submission).permit(:school_id, :year, :perpanjangan_tugas, :admin, extention_ids:[])
    end
end
