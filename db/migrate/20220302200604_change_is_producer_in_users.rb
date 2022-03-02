class ChangeIsProducerInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :is_producer, :boolean, default:false
  end
end
