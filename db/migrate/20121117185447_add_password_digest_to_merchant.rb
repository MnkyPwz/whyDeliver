class AddPasswordDigestToMerchant < ActiveRecord::Migration
  def change
    add_column :merchants, :password_digest, :string
  end
end
