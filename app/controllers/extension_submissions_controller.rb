class ExtensionSubmissionsController < ApplicationController
  before_action :set_extension_submission, only: [:show, :edit, :update, :destroy]

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
    @extension_submission = ExtensionSubmission.new(extension_submission_params)

    respond_to do |format|
      if @extension_submission.save
        format.html { redirect_to @extension_submission, notice: 'Permohonan perpanjanganberhasil dibuat.' }
      else
        format.html { render :new }
        flash["alert"] = @extension_submission.errors.full_messages
      end
    end
  end

  # PATCH/PUT /extension_submissions/1
  # PATCH/PUT /extension_submissions/1.json
  def update
    respond_to do |format|
      if @extension_submission.update(extension_submission_params)
        format.html { redirect_to @extension_submission, notice: 'Permohonan perpanjanganberhasil diperbarui.' }
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
      format.html { redirect_to extension_submissions_url, notice: 'Permohonan perpanjanganberhasil dihapus.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extension_submission
      @extension_submission = ExtensionSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extension_submission_params
      params.require(:extension_submission).permit(:school_id, :year, :approved_by_admin)
    end
end
