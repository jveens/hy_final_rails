class AddDefaultValueToEntryCompleted < ActiveRecord::Migration
  def change
  	change_column :entries, :completed, :boolean, :default => false
  end
end
