class RemoveColumnOrderId < ActiveRecord::Migration[6.0]
  def change
    remove_column :ratings, :order_id
    add_reference :ratings, :user, foreign_key: true
  end
end
