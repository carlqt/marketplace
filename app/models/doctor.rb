class Doctor < ActiveRecord::Base
  has_many :enquiry, as: :enquirible
  belongs_to :user

end
