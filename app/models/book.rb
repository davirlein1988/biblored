class Book < ApplicationRecord
	belongs_to :library

	def user
		User.find(user_id) rescue nil
	end

	def user=(u)
		uid = u.id rescue nil
		self.update!(user_id: uid)
	end

	def return
		self.update(user_id: nil)
	end

end