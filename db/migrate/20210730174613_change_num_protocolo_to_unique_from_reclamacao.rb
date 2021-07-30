class ChangeNumProtocoloToUniqueFromReclamacao < ActiveRecord::Migration[6.1]
  def change
    change_column :reclamacaos, :num_protocolo, :string, unique: true
  end
end
