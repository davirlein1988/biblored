class Library < ActiveRecord::Migration[5.2]
  def change
  	create_table :libraries do |t|
    	t.text :name
    	t.text :address
    	t.text :shelves

    	t.timestamps
    end
  end
end
