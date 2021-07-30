class ChangeTipoToIntegerReclamacao < ActiveRecord::Migration[6.1]
  def up
    change_column :reclamacaos, :tipo, :integer, default: 0
  end
  def down
    change_column :reclamacaos, :tipo, :string
  end
end
