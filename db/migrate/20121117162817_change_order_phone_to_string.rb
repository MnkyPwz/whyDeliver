class ChangeOrderPhoneToString < ActiveRecord::Migration
  def change
    change_column :orders, :customer_phone, :string
  end
end
