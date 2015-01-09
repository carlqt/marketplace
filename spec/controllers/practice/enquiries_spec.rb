require 'rails_helper'

RSpec.describe Practice::EnquiriesController do
  before(:each) do
    @current_user
  end

  end
  describe "#index" do
    it "renders the index view" do
      get :index
      response.should render_template :index
      binding.pry
    end
  end
end