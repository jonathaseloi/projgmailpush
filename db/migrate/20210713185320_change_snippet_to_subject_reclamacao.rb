class ChangeSnippetToSubjectReclamacao < ActiveRecord::Migration[6.1]
  def up
    add_column :reclamacaos, :subject, :string
  end
  def down
    remove_column :reclamacaos, :snippet, :string
  end
end
