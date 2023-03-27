class ApplicantsController < ApplicationController
  
  before_action :applicant_available, only: [:show ,:update, :edit, :destroy]

  def index
    @applicants = Applicant.all
  end

  def show 
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
  end

  def update
    if @applicant.update(applicant_params)
      redirect_to @applicant
    else
      render :edit 
    end
  end

  def destroy
    @applicant.destroy

    redirect_to root_path
  end

  private 
    def applicant_params
      params.require(:applicant).permit(:name, :email, :contact, :age, :experience, :role, :skills, :address, :state, :country, :pincode)
    end

    def applicant_available
      if Applicant.find_by(id: params[:id]).nil?
        redirect_to applicants_path
        flash[:notice] = "Item does not exist"
      else
        @applicant = Applicant.find_by(id: params[:id])
      end
    end

end