class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.references :user
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
