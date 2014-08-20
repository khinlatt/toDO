class AddBooleanDefault < ActiveRecord::Migration
  def change
    change_column :items, :done, :boolean, :default => false
    change_column :todos, :done, :boolean, :default => false
  end
end
