class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :street_number
      t.string :street_name, null: false
      t.string :zipcode, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
