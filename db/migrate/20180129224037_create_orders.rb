class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true
      t.string :status, default: 'in_progress'
      t.decimal :subtotal
      t.decimal :shipping
      t.decimal :total

      t.timestamps
    end
  end
end
