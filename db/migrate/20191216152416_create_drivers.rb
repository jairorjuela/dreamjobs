class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.integer  :identification
      t.integer  :transit_license
      t.string   :mail
      t.integer  :phone
      t.string   :addres

      t.timestamps
    end
  end
end
