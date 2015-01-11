class Doctor < ActiveRecord::Base
  has_many :enquiry

  def is_a_doctor?
    true
  end
end
