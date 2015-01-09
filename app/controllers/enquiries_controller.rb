class EnquiriesController < ApplicationController
  
  before_action :load_doctor
  
  def new
  end
  
  def create
  end
  
  private
  
  def load_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end
  
  def enquiries_params
  end
  
end
