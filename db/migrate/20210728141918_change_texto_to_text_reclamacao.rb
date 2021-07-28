class ChangeTextoToTextReclamacao < ActiveRecord::Migration[6.1]
  def up
    change_column :reclamacaos, :texto, :text
  end
  def down
    change_column :reclamacaos, :texto, :string
  end
end
