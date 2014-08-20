class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |i|
      i.string :description

      i.timestamps
    end
  end
end
