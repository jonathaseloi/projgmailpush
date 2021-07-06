class AddMessageidToPubsub < ActiveRecord::Migration[6.1]
  def change
    add_column :pubsubs, :messageid, :string
  end
end
