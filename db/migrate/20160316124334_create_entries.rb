class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :todo

      t.timestamps null: false
    end
  end
end
