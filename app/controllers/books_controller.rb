class BooksController < ApplicationController

	def index
		@books = Book.all
		@admin = user_signed_in? && current_user.admin 
	end

	def show
		@book = Book.find(params[:id])
	end

	def new
		@book = Book.new
	end
	def edit
    	@book = Book.find(params[:id])
  	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to @book 
	end

	def create
		@book = Book.create!(book_params)
		redirect_to "/books/#{@book.id}"
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to "/books"
	end

	def borrow
		book = Book.find(params[:id])
		if user_signed_in? and book.status.nil? or book.status = "available"
			book.update!(status: "borrowed", user_id: current_user.id)
		# elsif user_signed_in? and book.status = "borrowed"
		# 	book.
		else 
				
		end
		redirect_to "/books"
	end

	def renew
		
	end

	private
	def book_params
		params.require(:book).permit(:isbn, :title, :author, :publication_date, :cover_url, :summary, :status, :library_id)
	end

end