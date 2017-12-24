class ResumesController < ApplicationController
  def index
  	@resumes=Resume.all
  end

  def new
  	@resume=Resume.new
  end

  def create
  	resume=Resume.new(resume_params)
  	if resume.save
  		redirect_to resumes_path,notice: 'successfully uploaded'
  	else
      flash[:errors] = resume.errors.full_messages
  		redirect_to "/resumes/new"
  	end
  end

  def destroy
  	dresume=Resume.find(params[:id])
  	dresume.destroy
  	redirect_to resumes_path,notice: 'successfully deleted'
  end 

private
def resume_params
	params.require(:resume).permit(:name,:attachment)
	end

end
