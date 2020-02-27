class CreateCatelogItems < ActiveRecord::Migration[5.1]
  def change
    create_table :catelog_items do |t|
      t.string :name,             null: false
      t.integer :status,          null: false, default: 0
      t.text :description
      t.integer :collection_id
      t.string  :collection_type
      t.text :collection_url,     null: false
      t.integer :catelog_id,      null: false

      t.timestamps
    end

    add_index :catelog_items, :collection_id
  end
end
