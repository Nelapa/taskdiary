class TasksController < ApplicationController
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new params[:task]
    if @task.save
      flash[:notice] = 'Task created successfully'
      redirect_to tasks_path
    else
      flash[:error] = 'Error creating task'
      render :action => :new
    end
  end
  
  def list
    @tasks = Task.find(:all, :order=>'due asc')
  end
      
  def index
    list
    render :action => :list
  end
  
  def show
    @task = Task.find params[:id]
  end
  
  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to tasks_path
  end 
  
  def edit
    @task = Task.find params[:id]
  end
  
  def update
    @task = Task.find params[:id]
    if @task.update_attributes(params[:task])
      flash[:notice] = 'Task updated successfully'
      redirect_to task_path
  else
    flash[:error] = 'Error updating'
    render :action => :edit, :id => params[:id] 
   end
  end   

end
