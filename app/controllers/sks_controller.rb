class SksController < ApplicationController
  before_action :set_sk, only: [:show, :edit, :update, :destroy]
  before_action :set_teacher, only: [:new, :edit, :update]


  # GET /sks
  # GET /sks.json
  def index
    @sks = Sk.all
  end

  # GET /sks/1
  # GET /sks/1.json
  def show
  end

  # GET /sks/new
  def new
    @sk = Sk.new
  end

  # GET /sks/1/edit
  def edit
  end

  # POST /sks
  # POST /sks.json
  def create
    @sk = Sk.new(sk_params)

    respond_to do |format|
      if @sk.save
        format.html { redirect_to sks_path, notice: 'SK berhasil dibuat' }
      else
        format.html { render :new }
        flash["alert"] = @sk.errors.full_messages
      end
    end
  end

  # PATCH/PUT /sks/1
  # PATCH/PUT /sks/1.json
  def update
    @teacher = respond_to do |format|
      if @sk.update(sk_params)
        path = current_school.admin ? school_path(@teacher.school.id) : teachers_path
        format.html { redirect_to path, notice: 'SK berhasil diubah' }
      else
        format.html { render :edit }
        flash["alert"] = @sk.errors.full_messages
      end
    end
  end

  # DELETE /sks/1
  # DELETE /sks/1.json
  def destroy
    @sk.destroy
    respond_to do |format|
      format.html { redirect_to sks_url, notice: 'SK berhasil dihapus' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sk
      @sk = Sk.find(params[:id])
    end

    def set_teacher
      @teacher = Teacher.find(params[:teacher_id]) if params[:teacher_id]
      @teacher = Teacher.find(params[:sk][:teacher_id]) if params[:sk] and params[:sk][:teacher_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sk_params
      params.require(:sk).permit(:teacher_id, :year, :permohonan_perwakilan, :ijazah, :sertifikat_pendidik, :nuptk, :sk_perwakilan, :ktp_or_paspor, :kk, :cv, :sk_inpassing, :biodata_ln, :form_biaya, :pernyataan, :approved_by_school, :approved_by_admin, :note, :sk_untuk_guru, :admin)
    end
end
