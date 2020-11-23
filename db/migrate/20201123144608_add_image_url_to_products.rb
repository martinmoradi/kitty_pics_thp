class AddImageUrlToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :img_url, :string, null: false
  end
end
