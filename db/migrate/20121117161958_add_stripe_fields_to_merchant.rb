class AddStripeFieldsToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :stripe_customer_id, :string
    add_column :merchants, :last_four_digits, :string
  end
end
