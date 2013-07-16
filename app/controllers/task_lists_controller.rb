class TaskListsController < ApplicationController

	def index
		@project = Project.find(params[:project_id])
		@task_lists = @project.task_lists
	end

	def show
		@project_id = params[:project_id]
		@task_list = TaskList.find(params[:id])
	end

	def new
		@task_list = TaskList.new
		@project = Project.find(params[:project_id])
	end

	def edit
		@task_list = TaskList.find(params[:id])
		@projects = Project.all
	end

	def create
		@task_list = TaskList.new(task_list_params)

		respond_to do |format|
			if @task_list.save
				format.html { redirect_to project_task_list_url(params[:project_id], @task_list) }
			else
				format.html { render "new" }
			end
		end
	end

	def update
		@task_list = TaskList.find(params[:id])

		respond_to do |format|
			if @task_list.update(task_list_params)
				format.html { redirect_to project_task_list_url(params[:project_id], @task_list) }
			else
				format.html { render "edit" }
			end
		end
	end

	def destroy
		@task_list = TaskList.find(params[:id])

		respond_to do |format|
			if @task_list.destroy
				format.html { redirect_to project_task_lists_path }
			else
				format.html { redirect_to project_task_lists_path }
			end
		end
	end

	private

	def task_list_params
		params.require(:task_list).permit(:title, :description, :project_id)
	end
end
