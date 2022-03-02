class ChangeDateFormatInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :birthdate, :date
  end
end
