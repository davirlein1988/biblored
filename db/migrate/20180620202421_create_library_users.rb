class CreateLibraryUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :library_users do |t|
    	t.integer :library_id
    	t.integer :user_id

    	t.timestamps
    end
  end
end
