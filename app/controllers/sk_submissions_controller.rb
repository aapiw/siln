class SkSubmissionsController < ApplicationController
  before_action :set_sk_submission, only: [:show, :edit, :update, :destroy]

  # GET /sk_submissions
  # GET /sk_submissions.json
  def index
    @sk_submissions = SkSubmission.all
  end

  # GET /sk_submissions/1
  # GET /sk_submissions/1.json
  def show
  end

  # GET /sk_submissions/new
  def new
    @sk_submission = SkSubmission.new
  end

  # GET /sk_submissions/1/edit
  def edit
  end

  # POST /sk_submissions
  # POST /sk_submissions.json
  def create
    @sk_submission = SkSubmission.new(sk_submission_params)

    respond_to do |format|
      if @sk_submission.save
        format.html { redirect_to @sk_submission, notice: 'Sk submission was successfully created.' }
        format.json { render :show, status: :created, location: @sk_submission }
      else
        format.html { render :new }
        format.json { render json: @sk_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sk_submissions/1
  # PATCH/PUT /sk_submissions/1.json
  def update
    respond_to do |format|
      if @sk_submission.update(sk_submission_params)
        format.html { redirect_to @sk_submission, notice: 'Sk submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @sk_submission }
      else
        format.html { render :edit }
        format.json { render json: @sk_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sk_submissions/1
  # DELETE /sk_submissions/1.json
  def destroy
    @sk_submission.destroy
    respond_to do |format|
      format.html { redirect_to sk_submissions_url, notice: 'Sk submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sk_submission
      @sk_submission = SkSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sk_submission_params
      params.require(:sk_submission).permit(:year, :school_id)
    end
end
