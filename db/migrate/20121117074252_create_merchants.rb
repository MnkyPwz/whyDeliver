class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.integer :phone
      t.string :address
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
