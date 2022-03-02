class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :users, null: false, foreign_key: true
      t.references :parties, null: false, foreign_key: true

      t.timestamps
    end
  end
end
