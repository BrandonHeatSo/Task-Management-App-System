class TasksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
  end
end
