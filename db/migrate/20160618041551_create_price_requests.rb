class CreatePriceRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :price_requests do |t|
      t.string :name
      t.string :email_id
      t.string :mobile_no
      t.text :query

      t.timestamps
    end
  end
end
