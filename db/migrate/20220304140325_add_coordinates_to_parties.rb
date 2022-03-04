class AddCoordinatesToParties < ActiveRecord::Migration[6.1]
  def change
    add_column :parties, :latitude, :float
    add_column :parties, :longitude, :float
  end
end
