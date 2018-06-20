class AddColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :library_id, :integer
  end
end
