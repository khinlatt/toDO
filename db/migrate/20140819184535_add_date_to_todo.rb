class AddDateToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :dateposted, :date
  end
end
