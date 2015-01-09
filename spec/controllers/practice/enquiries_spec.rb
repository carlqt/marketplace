require 'rails_helper'

RSpec.describe Practice::EnquiriesController do

  shared_examples_for 'all actions' do
    it 'redirects to the home page when user is not a doctor'
  end

  describe "#index" do
    before(:each) do
      @doctor = Doctor.new
      @doctor.stub(:is_a_doctor?).and_return(true)
      # controller.current_user
    end

    it "renders the index view" do
      get :index
      binding.pry
      response.should render_template :index
    end
  end
end