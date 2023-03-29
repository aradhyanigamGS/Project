class InterviewsController < ApplicationController
  before_action :authenticate_register! 

  before_action :interview_available, only: [:show ,:edit , :update ,:destroy]
  
  def index
    @interviews = Interview.all
  end

  def show
  end

  def new 
    @interview = Interview.new
  end
  
  def create
    @interview = Interview.create(interview_params)
    if @interview.save
      redirect_to @interview 
      flash[:notice] = "Interview Scheduled Succesfully"
    

    else
      render :new
      flash[:alert] = "Interview does not Schedule"
    end

  end


  def edit 
  end

  def update    
    if @interview.update(interview_params)
      redirect_to @interview
    else
      render :edit
    end
  end

  def destroy
    @interview.destroy
    redirect_to interviews_path
  end

  private

    def interview_available
      if Interview.find_by(id: params[:id]).nil?
        redirect_to interviews_path
        flash[:alert] = "Interview doesn't exist"
      else
        @interview = Interview.find_by(id: params[:id])
      end
    end
    
    def interview_params
      params.require(:interview).permit(:register_id, :applicant_id , :round, :timing , :set_by , :feedback, :status)
    end

end
