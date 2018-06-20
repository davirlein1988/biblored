class Library < ApplicationRecord
	has_many :library_users
 	has_many :users, :through => :library_users
 	has_many :books
end