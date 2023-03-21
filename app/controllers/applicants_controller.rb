class ApplicantsController < ApplicationController
  
  def index
    @applicants = Applicant.all
  end

  def show 
    @applicant = Applicant.find(params[:id])
  end

  def new 
    @applicant = Applicant.new
  end

  def create 
    @applicant = Applicant.new(applicant_params)

    if @applicant.save
      redirect_to @applicant
    else
      render :new
    end
  end

  def edit 
    @applicant = Applicant.find(params[:id])
  end

  def update
    # byebug
    @applicant = Applicant.find(params[:id])
    
    if @applicant.update(applicant_params)
      redirect_to @applicant
    else
      render :edit 
    end
  end

  def destroy
    @applicant = Applicant.find(params[:id])
    @applicant.destroy

    redirect_to root_path
  end

  private 
    def applicant_params
      params.require(:applicant).permit(:name, :email, :contact, :age, :experience, :role, :skills, :address, :state, :country, :pincode)
    end

end
