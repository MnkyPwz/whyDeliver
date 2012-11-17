class AddDeliveryDistanceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_distance, :float
  end
end
