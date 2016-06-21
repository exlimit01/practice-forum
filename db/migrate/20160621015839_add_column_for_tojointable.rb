class AddColumnForTojointable < ActiveRecord::Migration
  def change
    add_column :categories, :name, :string
    add_column :topic_categories, :topic_id, :integer
    add_column :topic_categories, :category_id, :integer

    add_index :topic_categories, :topic_id
    add_index :topic_categories, :category_id
  end
end
