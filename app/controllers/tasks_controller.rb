class TasksController < ApplicationController

  def index
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end
end
