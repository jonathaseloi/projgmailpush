class RemoveSnippetFromReclamacao < ActiveRecord::Migration[6.1]
  def change
    remove_column :reclamacaos, :snippet
  end
end
