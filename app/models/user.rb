class User < ActiveRecord::Base
  has_one :doctor
  has_many :enquiries, as: :enquirible

  def is_a_doctor?
    doctor
  end
end
