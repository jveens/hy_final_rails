class AddCompletedToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :completed, :boolean
  end
end
