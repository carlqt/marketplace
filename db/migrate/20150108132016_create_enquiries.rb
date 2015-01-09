class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.integer :doctor_id
      t.string :name
      t.text :question

      t.timestamps
    end
  end
end
