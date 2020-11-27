class RemoveAddressFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :address_id, foreign_key: true
  end
end
