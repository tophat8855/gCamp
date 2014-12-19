class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action do
    @project = Project.find(params[:project_id])
  end
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @project.tasks.order(sort_column + " " + sort_direction)
    if params[:type] == 'incomplete'
      @tasks = @tasks.where(complete: false)
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = @project.tasks.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = @project.tasks.new
  end

  # GET /tasks/1/edit
  def edit
    @task = @project.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @project.tasks.new(task_params)
    @task.complete = false
    if @task.save
      flash[:success] = "Task was successfully created"
      redirect_to project_task_path(@project, @task)
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task = @project.tasks.find(params[:id])
      if @task.update(task_params)
        flash[:success] = "Task was successfully updated"
        redirect_to project_tasks_path(@project)
      else
        render :edit
      end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = @project.tasks.find(params[:id])
    @task.destroy
    flash[:success] = 'Task was successfully destroyed.'
    redirect_to project_tasks_path(@project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :complete, :due_date)
    end

    def sort_column
      params[:sort] || 'description'
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
