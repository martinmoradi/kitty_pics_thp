class RemoveAddressFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :user_id, foreign_key: true
  end
end
