class RemoveOrderFromLineItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :line_items, :order_id, foreign_key: true
  end
end
