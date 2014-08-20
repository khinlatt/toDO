class AddTodoToItems < ActiveRecord::Migration
  def change
    add_column :items, :todo_id, :integer
  end
end
