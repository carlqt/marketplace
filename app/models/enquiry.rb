class Enquiry < ActiveRecord::Base
  belongs_to :enquirible, polymorphic: true
end
