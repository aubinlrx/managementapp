class DocumentsController < ApplicationController

	def index
		@project = Project.find(params[:project_id])
		@documents = @project.documents
	end

	def show
		@document = Document.find(params[:id])
	end

	def new
		@document = Document.new
	end

	def edit
		@document = Document.find(params[:id])
	end

	def update
		@document = Document.find(params[:id])

		respond_to do |format|
			if @document.update(params[:document])
				format.html { redirect_to project_document_path(:project_id, :id) }
			else
				format.html { redirect_to edit_project_document_path(:project_id, :id) }
			end
		end
	end

	def create
		@document = Document.new(document_params)

		respond_to do |format|
			if @document.save
				format.html { redirect_to project_document_path }
			else
				format.html { render :action => 'new' }
			end
		end
	end

	def destroy
		@document = Document.find(params[:id])

		respond_to do |format|
			if @document.destroy
				format.html { redirect_to project_document_path }
			else
				format.html { redirect_to project_document_path }
			end
		end
	end

	private 

	def document_params
		params.require(:document).permit(:title, :content)
	end

end
