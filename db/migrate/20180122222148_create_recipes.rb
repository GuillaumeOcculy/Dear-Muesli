class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :quantity

      t.timestamps
    end
    add_index :recipes, :name, unique: true
  end
end
