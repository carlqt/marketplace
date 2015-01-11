class EnquiryPolymorphic < ActiveRecord::Migration
  def change
    remove_column :enquiries, :doctor_id
    add_column :enquiries, :enquirible_id, :integer
    add_column :enquiries, :enquirible_type, :string 
  end
end
