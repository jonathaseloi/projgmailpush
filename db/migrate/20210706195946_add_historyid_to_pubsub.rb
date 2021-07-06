class AddHistoryidToPubsub < ActiveRecord::Migration[6.1]
  def change
    add_column :pubsubs, :historyid, :string
    add_column :pubsubs, :texto, :string
  end
end
