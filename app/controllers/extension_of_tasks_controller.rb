class ExtensionOfTasksController < ApplicationController
  before_action :set_extension_of_task, only: [:show, :edit, :update, :destroy]

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
        format.html { redirect_to @extension_of_task, notice: 'Extension of task was successfully created.' }
        format.json { render :show, status: :created, location: @extension_of_task }
      else
        format.html { render :new }
        format.json { render json: @extension_of_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extension_of_tasks/1
  # PATCH/PUT /extension_of_tasks/1.json
  def update
    respond_to do |format|
      if @extension_of_task.update(extension_of_task_params)
        format.html { redirect_to @extension_of_task, notice: 'Extension of task was successfully updated.' }
        format.json { render :show, status: :ok, location: @extension_of_task }
      else
        format.html { render :edit }
        format.json { render json: @extension_of_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extension_of_tasks/1
  # DELETE /extension_of_tasks/1.json
  def destroy
    @extension_of_task.destroy
    respond_to do |format|
      format.html { redirect_to extension_of_tasks_url, notice: 'Extension of task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extension_of_task
      @extension_of_task = ExtensionOfTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extension_of_task_params
      params.require(:extension_of_task).permit(:teacher_id, :year, :rekomendasi_perwakilan, :persetujuan_pemda_or_sekolah, :sk_mendikbud, :surat_persetujuan_setneg, :assessment, :note, :approved_by_school)
    end
end
