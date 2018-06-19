class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
    	t.integer :isbn
    	t.text :title
    	t.text :author
    	t.date :publication_date
    	t.text :cover_url
    	t.text :summary
    	t.text :status
    	t.integer :user_id

    	t.timestamps

    end
  end
end
