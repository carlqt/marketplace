class Practice::EnquiriesController < Practice::BaseController

  def index
    @enquiries = @practice.enquiries
  end

  def show
  end

  def reject
    enquiry = current_user.enquiry.find_by(id: params[:id])
    enquiry.destroy
    redirect_to practice_enquiries_path(enquiry)
  end

  def confirm
    enquiry = current_user.enquiry.find_by(id: params[:id])
    enquiry.update_attributes(enquiry_params)
    redirect_to practice_enquiries_path(enquiry)
  end

  private

  def enquiry_parameters
    params.require(:enquiry).permit(:status)
  end

end
