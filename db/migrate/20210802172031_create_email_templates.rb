class CreateEmailTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :email_templates do |t|
      t.string :name
      t.string :description
      t.longtext :body

      t.timestamps
    end
  end
end
