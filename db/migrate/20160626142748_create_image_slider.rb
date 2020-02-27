class CreateImageSlider < ActiveRecord::Migration[5.1]
  def change
    create_table :image_sliders do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
