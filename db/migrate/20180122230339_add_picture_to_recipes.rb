class AddPictureToRecipes < ActiveRecord::Migration[5.1]
  def up
    add_attachment :recipes, :picture
  end

  def down
    remove_attachment :recipes, :picture
  end
end
