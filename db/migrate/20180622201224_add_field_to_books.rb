class AddFieldToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :return_date, :date
  end
end
