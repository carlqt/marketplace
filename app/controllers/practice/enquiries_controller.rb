class Practice::EnquiriesController < Practice::BaseController

  def index
    @enquiries = @practice.enquiries
  end

  def show
  end

  def reject
  end

  def confirm
  end

end
