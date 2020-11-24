class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
