class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, 
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @done_tasks = Task.where(is_done: true)
    @undone_tasks = Task.where(is_done: false)
    @user = current_user
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @comments = @task.comments
    @comment = Comment.new
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.email = current_user.email
    @task.user_id = current_user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
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
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
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
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def completed
    @task = Task.find(params[:id])
    @task.is_done = true
    @task.save
    if @task.save
      redirect_to @task, notice: '完了にしました'
    else
      render :index
    end
  end

  def incomplete
    @task = Task.find(params[:id])
    @task.is_done = false
    @task.save
    if @task.save
      redirect_to @task, notice: '完了にしました'
    else
      render :index
    end
  end

  def authentication
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :is_done, :duedate, :assignee_id)
    end
end
