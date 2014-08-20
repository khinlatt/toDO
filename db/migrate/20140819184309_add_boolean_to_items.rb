class AddBooleanToItems < ActiveRecord::Migration
  def change
    add_column :items, :done, :boolean, default: false
    add_column :items, :dateposted, :date
  end
end
