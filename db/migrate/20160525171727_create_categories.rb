class CreateCategories < ActiveRecord::Migration[5.1]
  def self.up
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :parent
      t.string :categorized_object

      t.timestamps
    end
    # populate the table
    Category.create name: "Uncategorized", description: "Default category", categorized_object: "posts"
    Category.create name: "Uncategorized", description: "Default category", categorized_object: "products"
  end

  def self.down
    drop_table :categories
  end

end
