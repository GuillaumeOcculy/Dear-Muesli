class CreateRecipezations < ActiveRecord::Migration[5.1]
  def change
    create_table :recipezations do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :recipe, foreign_key: true
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
