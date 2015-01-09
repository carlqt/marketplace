class Practice::BaseController < ApplicationController
  
  before_action :load_practice
  
  private
  
  def load_practice
    @practice = current_user
    redirect_to root_path, :error => "You need to be a doctor to view this page" unless @practice.is_a_doctor?
  end
  
end
