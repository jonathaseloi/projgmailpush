class AddStatusToReclamacao < ActiveRecord::Migration[6.1]
  def change
    add_column :reclamacaos, :status, :string
  end
end
