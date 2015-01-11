class Practice::EnquiriesController < Practice::BaseController

  def index
    @enquiries = @practice.enquiries
  end

  def show
  end

  def reject
    enquiry = current_user.enquiries.find_by(id: params[:id])
    enquiry.update_attributes(enquiry_params)
    redirect_to practice_enquiries_path
  end

  def confirm
    enquiry = current_user.enquiries.find_by(id: params[:id])
    enquiry.update_attributes(enquiry_params)
    redirect_to practice_enquiry_path(enquiry)
  end

  private

  def enquiry_params
    params.require(:enquiry).permit(:status)
  end

end
