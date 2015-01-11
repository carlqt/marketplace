class User < ActiveRecord::Base
  has_one :doctor
  has_many :enquiries, as: :enquirible
end
