class TasksController < ApplicationController

	def index
		@task_list = TaskList.find(params[:task_list_id])
		@tasks = @task_list.tasks
	end

	def show
		@task = Task.find(params[:id])
	end

	def new
		@task = Task.new
	end

	def edit
		@task = Task.find(params[:id])
	end

	def create
		@task = Task.new(task_params)

		respond_to do |format|
			if @task.save
				format.html { redirect_to @task }
			else
				format.html { render "new" }
			end
		end
	end

	def update
		@task = Task.find(params[:id])

		respond_to do |format|
			if @task.update(task_params)
				format.html { redirect_to @task }
			else
				format.html { render 'edit' }
			end
		end
	end

	def destroy
		respond_to do |format|
			if @task.destroy
				format.html { redirect_to tasks_path }
			else
				format.html { redirect_to tasks_path }
			end
		end
	end

	private

	def task_params
		params.require(:task).permit(:title, :description, :task_list_id)
	end
end
