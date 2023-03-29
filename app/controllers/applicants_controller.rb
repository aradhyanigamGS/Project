class ApplicantsController < ApplicationController
  before_action :authenticate_register! 
  
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
      skill_arr = @applicant.skills
      skill_arr.each_with_index do |val,index|
        sk = Skill.find_by(name: skill_arr[index])
        skill_arr[index] = sk.id
      end
      @applicant.skills = skill_arr
      @applicant.save
      redirect_to @applicant
    else
      render :new
    end    

  end

  def edit 
  end

  def update
    if @applicant.update(applicant_params)
      
      skill_arr = @applicant.skills
      skill_arr.each_with_index do |val,index|
        sk = Skill.find_by(name: skill_arr[index])
        skill_arr[index] = sk.id
      end
      @applicant.skills = skill_arr
      @applicant.save
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
      params.require(:applicant).permit(:name, :email, :contact, :age, :experience, :role, :address, :state, :country, :pincode, skills:[])
    end

    def applicant_available
      @applicant = Applicant.find_by(id: params[:id])
      if @applicant.nil?
        redirect_to applicants_path
        flash[:alert] = "Item does not exist"
      end
    end

end
