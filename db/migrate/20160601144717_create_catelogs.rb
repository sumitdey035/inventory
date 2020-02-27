class CreateCatelogs < ActiveRecord::Migration[5.1]
  def change
    create_table :catelogs do |t|
      t.string :name,       null: false
      t.integer :status,    null: false, default: 0
      t.text :description

      t.timestamps
    end
  end
end
