class AddColumnTypeToReclamacao < ActiveRecord::Migration[6.1]
  def change
    add_column  :reclamacaos, :type, :string
  end
end
