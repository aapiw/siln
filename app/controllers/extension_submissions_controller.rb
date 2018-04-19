class ExtensionSubmissionsController < ApplicationController
  before_action :set_extension_submission, only: [:show, :edit, :update, :destroy]

  # GET /extension_submissions
  # GET /extension_submissions.json
  def index
    @extension_submissions = ExtensionSubmission.all
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
        format.html { redirect_to @extension_submission, notice: 'Extension submission was successfully created.' }
        format.json { render :show, status: :created, location: @extension_submission }
      else
        format.html { render :new }
        format.json { render json: @extension_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extension_submissions/1
  # PATCH/PUT /extension_submissions/1.json
  def update
    respond_to do |format|
      if @extension_submission.update(extension_submission_params)
        format.html { redirect_to @extension_submission, notice: 'Extension submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @extension_submission }
      else
        format.html { render :edit }
        format.json { render json: @extension_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extension_submissions/1
  # DELETE /extension_submissions/1.json
  def destroy
    @extension_submission.destroy
    respond_to do |format|
      format.html { redirect_to extension_submissions_url, notice: 'Extension submission was successfully destroyed.' }
      format.json { head :no_content }
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
