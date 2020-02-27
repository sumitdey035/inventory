class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :user,       index: true
      t.string :name,           null: false
      t.text :street_address,   null: false
      t.string :landmark
      t.string :city,           null: false
      t.string :state,          null: false
      t.string :country,        null: false
      t.integer :pincode,       null: false
      t.string :phone_number,   null: false
      t.boolean :default,       default: false

      t.timestamps
    end
  end
end
