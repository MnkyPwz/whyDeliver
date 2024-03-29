class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :merchant_id
      t.integer :transporter_id
      t.string :order_status
      t.float :destination_lat
      t.float :destination_long
      t.string :address
      t.string :customer_first_name
      t.string :customer_last_name
      t.string :customer_email
      t.integer :customer_phone
      t.integer :charge
      t.string :product_name

      t.timestamps
    end
  end
end
