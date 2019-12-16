class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.integer  :identification
      t.string   :mail
      t.integer  :phone

      t.timestamps
    end
  end
end
