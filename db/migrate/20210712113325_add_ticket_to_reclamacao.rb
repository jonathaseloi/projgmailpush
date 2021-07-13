class AddTicketToReclamacao < ActiveRecord::Migration[6.1]
  def change
    add_column :reclamacaos, :ticket_id, :integer
  end
end
