require 'rails_helper'

RSpec.describe Practice::EnquiriesController do
  before(:each) do
    @doctor_sign_in = proc {controller.stub(:load_practice).and_return(true)}
  end

  shared_examples_for 'other actions' do |action, params|
    it 'redirects to the home page when user is not a doctor' do
      user = double('user')
      allow(user).to receive(:is_a_doctor?).and_return(false)
      controller.stub(:current_user).and_return(user)

      get :"#{action}", params
      expect(response).to redirect_to(root_path)
    end
  end

  describe "#index" do
    it "renders the index view" do
      @doctor_sign_in.call
      user = double('user')
      allow(user).to receive(:enquiries).and_return([])
      controller.instance_variable_set(:@practice, user)
      get :index
      expect(response).to render_template :index
    end

    it_behaves_like 'other actions', 'index'
  end

  describe "#show" do
    it "renders the show view" do
      @doctor_sign_in.call
      enquiry = Enquiry.stub(:new)
      get :show, {id: 1}
      expect(response).to render_template(:show)
    end

    it_behaves_like 'other actions', 'show', id: 1
  end

  describe "#confirm" do
    it "redirects to enquiry if confirmed" do
      @doctor_sign_in.call
      enquiry = double('enquiry')
      controller.stub_chain(:current_user, :enquiries, :find_by).and_return(enquiry)
      allow(enquiry).to receive(:update_attributes).with(status: "confirm").and_return(true)
      put :confirm, id: 1, enquiry: { status: "confirm" }
      expect(response).to redirect_to(practice_enquiry_path(enquiry))
    end
  end

  describe "#reject" do
    it "redirects to enquiry if confirmed" do
      @doctor_sign_in.call
      enquiry = double('enquiry')
      controller.stub_chain(:current_user, :enquiries, :find_by).and_return(enquiry)
      allow(enquiry).to receive(:update_attributes).with(status: "reject").and_return(true)
      put :reject, id: 1, enquiry: { status: "reject" }
      expect(response).to redirect_to(practice_enquiries_path)
    end
  end

end