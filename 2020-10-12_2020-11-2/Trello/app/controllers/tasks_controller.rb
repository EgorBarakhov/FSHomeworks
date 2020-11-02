class TasksController < ApplicationController
  before_action :get_tasklist
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @tasklist.tasks
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @tasklist.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @tasklist.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasklist_tasks_path(@tasklist), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasklist_tasks_path(@tasklist), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasklist_tasks_path(@tasklist), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_tasklist
      @tasklist = Tasklist.find(params[:tasklist_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @tasklist.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :description, :tasklist_id)
    end
end
