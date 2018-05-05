class SkSubmissionsController < ApplicationController
  before_action :set_school
  before_action :set_sk_submission, only: [:show, :edit, :update, :destroy, :teachers_based_on_year]
  before_action :set_teachers_based_on_year, only:[:new, :edit]

  # GET /sk_submissions
  # GET /sk_submissions.json
  def index
    if current_school.admin
      @sk_submissions = SkSubmission.all
    else
      @sk_submissions = current_school.sk_submissions
    end
    
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
    sk_submission_params2 = sk_submission_params
    sk_submission_params2["recent_sk"].reject!(&:blank?)

    @sk_submission = SkSubmission.new(sk_submission_params2)
    respond_to do |format|
      if @sk_submission.save
        format.html { redirect_to sk_submissions_url, notice: 'Pengajuan SK berhasil dibuat.' }
      else
        format.html { render :new }
        flash["alert"] = @sk_submission.errors.full_messages
      end
    end
  end

  # PATCH/PUT /sk_submissions/1
  # PATCH/PUT /sk_submissions/1.json
  def update
    sk_submission_params2 = sk_submission_params
    sk_submission_params2["recent_sk"].reject!(&:blank?)
    respond_to do |format|
      if @sk_submission.update(sk_submission_params2)
        format.html { redirect_to sk_submissions_url, notice: 'Pengajuan SK berhasil diperbarui.' }
      else
        format.html { render :edit }
        flash["alert"] = @sk_submission.errors.full_messages
      end
    end
  end

  # DELETE /sk_submissions/1
  # DELETE /sk_submissions/1.json
  def destroy
    @sk_submission.destroy
    respond_to do |format|
      format.html { redirect_to sk_submissions_url, notice: 'Pengajuan SK berhasil dihapus.' }
    end
  end
  
  def teachers_based_on_year
    @teachers_based_on_year = Sk.show_teachers_based_year(@school.teachers.pluck(:id), params[:year])
    render json: @teachers_based_on_year.map {|sk| [ sk.teacher.name, sk.id ] }
  end

  private
    def set_school
      if params[:school_id]
        params_school = params[:school_id]
      else
        params_school = params[:sk_submissions][:school_id] if params[:sk_submissions]
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

    def set_teachers_based_on_year
      year = @sk_submission ? @sk_submission.year : params[:year]
      @teachers_based_on_year = Sk.show_teachers_based_year(@school.teachers.pluck(:id), year.to_s)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_sk_submission
      if current_school.admin
        @school = School.find(params[:school_id])
      else
        @school = current_school
      end
      @sk_submission = SkSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sk_submission_params
      params.require(:sk_submission).permit(:year, :school_id, :admin, recent_sk:[])
    end
end
