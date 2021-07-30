class ChangeTypeToTipoReclamacao < ActiveRecord::Migration[6.1]
  def up
    rename_column :reclamacaos, :type, :tipo
  end

  def down
    rename_column :reclamacaos, :tipo, :type
  end
end
