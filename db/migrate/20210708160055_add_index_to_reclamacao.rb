class AddIndexToReclamacao < ActiveRecord::Migration[6.1]
  def change
    add_index :reclamacaos, :message_id, unique: true
  end
end
