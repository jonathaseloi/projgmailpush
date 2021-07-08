class CreateReclamacaos < ActiveRecord::Migration[6.1]
  def change
    create_table :reclamacaos do |t|
      t.string :texto
      t.integer :message_id
      t.integer :history_id
      t.integer :position
      t.integer :reclamacao_owner_id

      t.timestamps
    end
  end
end
