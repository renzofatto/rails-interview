class ItemsMigration < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |i|
      i.belongs_to :todo_list
      i.string :title, null: false
      i.string :description, null: false
    end
  end
end
