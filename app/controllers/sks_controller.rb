class SksController < ApplicationController
  before_action :set_sk, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @sk, notice: 'Sk was successfully created.' }
        format.json { render :show, status: :created, location: @sk }
      else
        format.html { render :new }
        format.json { render json: @sk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sks/1
  # PATCH/PUT /sks/1.json
  def update
    respond_to do |format|
      if @sk.update(sk_params)
        format.html { redirect_to @sk, notice: 'Sk was successfully updated.' }
        format.json { render :show, status: :ok, location: @sk }
      else
        format.html { render :edit }
        format.json { render json: @sk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sks/1
  # DELETE /sks/1.json
  def destroy
    @sk.destroy
    respond_to do |format|
      format.html { redirect_to sks_url, notice: 'Sk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sk
      @sk = Sk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sk_params
      params.require(:sk).permit(:teacher_id, :year, :permohonan_perwakilan, :ijazah, :sertifikat_pendidik, :nuptk, :sk_perwakilan, :ktp_or_paspor, :kk, :cv, :sk_inpassing, :biodata_ln, :form_biaya, :pernyataan, :approved_by_school, :approved_by_admin, :note, :sk_for_teacher)
    end
end
