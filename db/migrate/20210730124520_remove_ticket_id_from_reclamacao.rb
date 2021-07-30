class RemoveTicketIdFromReclamacao < ActiveRecord::Migration[6.1]
  def change
    remove_column :reclamacaos, :ticket_id
  end
end
