class CreateHisttickets < ActiveRecord::Migration[6.1]
  def change
    create_table :histtickets do |t|

      t.timestamps
    end
  end
end
