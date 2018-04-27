class ExtensionOfTasksController < ApplicationController
  before_action :set_extension_of_task, only: [:show, :edit, :update, :destroy]
  before_action :set_teacher, only: [:new, :edit]

  # GET /extension_of_tasks
  # GET /extension_of_tasks.json
  def index
    @extension_of_tasks = ExtensionOfTask.all
  end

  # GET /extension_of_tasks/1
  # GET /extension_of_tasks/1.json
  def show
  end

  # GET /extension_of_tasks/new
  def new
    @extension_of_task = ExtensionOfTask.new
  end

  # GET /extension_of_tasks/1/edit
  def edit
  end

  # POST /extension_of_tasks
  # POST /extension_of_tasks.json
  def create
    @extension_of_task = ExtensionOfTask.new(extension_of_task_params)

    respond_to do |format|
      if @extension_of_task.save
        format.html { redirect_to extension_of_tasks_path, notice: 'Perpanjangan tugas berhasil dibuat.' }
      else
        format.html { render :new }
        flash["alert"] = @extension_of_task.errors.full_messages
      end
    end
  end

  # PATCH/PUT /extension_of_tasks/1
  # PATCH/PUT /extension_of_tasks/1.json
  def update
    respond_to do |format|
      if @extension_of_task.update(extension_of_task_params)
        format.html { redirect_to @extension_of_task, notice: 'Perpanjangan tugas berhasil diubah.' }
      else
        format.html { render :edit }
        flash["alert"] = @extension_of_task.errors.full_messages
      end
    end
  end

  # DELETE /extension_of_tasks/1
  # DELETE /extension_of_tasks/1.json
  def destroy
    @extension_of_task.destroy
    respond_to do |format|
      format.html { redirect_to extension_of_tasks_url, notice: 'Perpanjangan tugas berhasil dihapus.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extension_of_task
      @extension_of_task = ExtensionOfTask.find(params[:id])
    end

    def set_teacher
      @teacher = Teacher.find(params[:teacher_id]) if params[:teacher_id]
      @teacher = Teacher.find(params[:extension_of_task][:teacher_id]) if params[:extension_of_task] and params[:extension_of_task][:teacher_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extension_of_task_params
      params.require(:extension_of_task).permit(:teacher_id, :year, :rekomendasi_perwakilan, :persetujuan_pemda_or_sekolah, :sk_mendikbud, :surat_persetujuan_setneg, :assessment, :note, :approved_by_school)
    end
end
