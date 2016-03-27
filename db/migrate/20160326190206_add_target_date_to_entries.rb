class AddTargetDateToEntries < ActiveRecord::Migration
  def change
  	add_column :entries, :target_date, :date
  end
end
