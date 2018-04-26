class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    if current_school.admin
      # @teachers = Teacher.all
    else
      @teachers = current_school.teachers
    end
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new

    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teachers_path, notice: 'Guru berhasil ditambahkan.' }
      else
        format.html { render :new }
        flash["alert"] = @teacher.errors.full_messages
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher, notice: 'Guru berhasil diubah.' }
      else
        format.html { render :edit }
        flash["alert"] = @teacher.errors.full_messages
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Guru berhasil dihapus.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:school_id, :submission_id, :name, :pns, :age, :period_of_teaching, :number_of_extension, :expire)
    end
end
