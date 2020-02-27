class AddAvatarToPictures < ActiveRecord::Migration[5.1]
  def up
    add_attachment :pictures, :avatar
  end

  def down
    remove_attachment :pictures, :avatar
  end
end
