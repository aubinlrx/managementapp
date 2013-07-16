class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(project_params)

		respond_to do |format|
			if @project.save
				format.html { redirect_to @project }
			else
				format.html { render :action => "new" }
			end
		end
	end

	def update
		@project = Project.find(params[:id])

		respond_to do |format|
			if @project.update(project_params)
				format.html { redirect_to @project }
			else
				format.html { redirect_to edit_project_path(:id) }
			end
		end
	end

	def destroy
		@project = Project.find(params[:id])

		respond_to do |format|
			if @project.destroy
				format.html { redirect_to projects_path }
			else
				format.html { redirect_to projects_path }
			end
		end
	end

	private

	def project_params
		params.require(:project).permit(:title, :description)
	end
end
