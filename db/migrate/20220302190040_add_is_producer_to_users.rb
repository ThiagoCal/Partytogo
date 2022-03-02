class AddIsProducerToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_producer, :boolean
  end
end
