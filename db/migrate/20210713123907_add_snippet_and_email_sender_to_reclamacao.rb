class AddSnippetAndEmailSenderToReclamacao < ActiveRecord::Migration[6.1]
  def change
    add_column :reclamacaos, :snippet, :string
    add_column :reclamacaos, :email_sender, :string
  end
end
