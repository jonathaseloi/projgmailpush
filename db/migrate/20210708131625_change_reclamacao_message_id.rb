class ChangeReclamacaoMessageId < ActiveRecord::Migration[6.1]
  def up
    change_column :reclamacaos, :message_id, :string
    change_column :reclamacaos, :history_id, :string
    change_column :reclamacaos, :reclamacao_owner_id, :string
  end
  def down
    change_column :reclamacaos, :message_id, :integer
    change_column :reclamacaos, :history_id, :integer
    change_column :reclamacaos, :reclamacao_owner_id, :integer
  end
end
