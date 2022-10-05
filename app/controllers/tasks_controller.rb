class TasksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @task = Task.new(params[:task])
    if @task.save
      # 保存成功の場合、ここに記述した処理が実行される。
    else
      render :new
    end
  end
end
