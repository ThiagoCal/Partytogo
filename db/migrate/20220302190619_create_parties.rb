class CreateParties < ActiveRecord::Migration[6.1]
  def change
    create_table :parties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.datetime :date
      t.string :category
      t.text :description
      t.float :rating
      t.float :price
      t.integer :capacity
      t.boolean :is_active

      t.timestamps
    end
  end
end
