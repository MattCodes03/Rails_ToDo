class TodoController < ApplicationController
  def index
    @tasks = Task.all # Fetch all Tasks
  end

  def show
    @task = Task.find(params[:id]) # Find the task by ID
  end

  def new
    @task = Task.new # Create new Task Object
  end

  def create
    @task = Task.new(task_params) # Create new tasks based on provided parameters

    if @task.save # Save the task, redirect if successful.
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity  # Re-render the new form on failure
    end
  end

  def edit
    @task = Task.find(params[:id]) # Find the task to edit
  end

  def update
    @task = Task.find(params[:id]) # Find the task by ID

    if @task.update(task_params_update) # Update the task with the provided parameters
      redirect_to task_path(@task), notice: 'Task was successfully updated.' # Redirect on success
    else
      render :edit # Re-render the edit form on failure
    end
  end

  def destroy
    @task = Task.find(params[:id]) # Find the task by ID
  
    if @task.destroy # Attempt to destroy the found Task
      redirect_to root_path, notice: 'Task was successfully deleted.' # Redirect after deletion
    else
      redirect_to root_path, alert: 'Error deleting task.' # Redirect with an error message if deletion fails
    end
  end
  
  

private
def task_params
  params.require(:task).permit(:title, :description)
end
  def task_params_update
    params.require(:task).permit(:title, :description, :completed)
  end
end
