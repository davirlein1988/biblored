class BooksController < ApplicationController

	def index
		@books = Book.all 
	end

	def show
		@book = Book.where(isbn: params[:isbn, :author, :title])
	end

	def new
		@book = Book.new
	end

	def update
		@book = Book.find(params[:isbn])
		@book.update(book_params)
		redirect_to @book 
	end

	def create
		@book = Book.create(book_params)
		redirect_to "/books/#{@book.isbn}"
	end

	def destroy
		@book = Book.find(params[:isbn])
		@book.destroy
		redirect_to "/books"
	end

	private
	def book_params
		params.require(:book).permit(:isbn, :title, :author, :publication_date, :cover_url, :summary, :status, :user_id)
	end

end