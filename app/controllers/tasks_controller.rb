class TasksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end
end
