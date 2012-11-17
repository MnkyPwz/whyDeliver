class ChangeStatusIdToOrderStatusId < ActiveRecord::Migration
  def change
    rename_column :orders, :status_id, :order_status_id
  end
end
