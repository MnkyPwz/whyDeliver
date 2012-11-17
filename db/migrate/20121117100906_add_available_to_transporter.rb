class AddAvailableToTransporter < ActiveRecord::Migration
  def change
    add_column :transporters, :available, :boolean
  end
end
