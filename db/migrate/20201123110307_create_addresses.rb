class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_number
      t.string :street_name
      t.string :zipcode
      t.string :city
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
