class ChangeTicketIdToNumProtocoloReclamacao < ActiveRecord::Migration[6.1]
  def up
    add_column :reclamacaos, :num_protocolo, :string
  end
  def down
    remove_column :reclamacaos, :ticket_id, :integer
  end
end
