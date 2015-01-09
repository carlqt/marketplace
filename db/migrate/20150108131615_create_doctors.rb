class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.integer :doctor_id
      t.string :service

      t.timestamps
    end
  end
end
