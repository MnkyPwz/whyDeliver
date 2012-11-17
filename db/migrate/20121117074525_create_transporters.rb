class CreateTransporters < ActiveRecord::Migration
  def change
    create_table :transporters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.float :current_lat
      t.float :current_long

      t.timestamps
    end
  end
end
