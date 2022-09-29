class TasksController < ApplicationController

  def index
    @tasks = @user.tasks
  end
end
