class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :addressable, polymorphic: true
      t.string :category, default: 'billing'
      t.string :first_name
      t.string :last_name
      t.string :entreprise_name
      t.string :email
      t.string :phone
      t.string :street_name
      t.string :street_name_2
      t.string :postal_code
      t.string :city
      t.string :country, default: 'France'
      t.text :note

      t.timestamps
    end
  end
end
