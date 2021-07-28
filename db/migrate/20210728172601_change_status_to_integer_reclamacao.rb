class ChangeStatusToIntegerReclamacao < ActiveRecord::Migration[6.1]
  def up
    change_column :reclamacaos, :status, :integer, default: 0
  end
  def down
    change_column :reclamacaos, :status, :string
  end
end
