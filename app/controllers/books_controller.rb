class BooksController < ApplicationController

	before_action :set_admin
	before_action :admin_check, only: [:new, :create, :update, :edit, :destroy]
	def index
		@books = Book.all	
		@my_books =@books.where(user_id: current_user.id) rescue []	 
		
	end

	def show
		@book = Book.find(params[:id])	
		@borrow = current_user && !current_user.books.include?(@book)	
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
		book = Book.find(params[:book_id])
		if user_signed_in? and book.status.nil? or book.status = "available"
			book.update!(status: "borrowed", user_id: current_user.id, return_date: Date.today + 2.weeks )
		# elsif user_signed_in? and book.status = "borrowed"
		# 	book. 
				
		end
		redirect_to "/books"
	end

	def renew
		book = Book.find(params[:book_id])
		if user_id = current_user and book.status = "borrowed" 
			book.update!(status: "renewed", return_date: Date.today + 2.weeks )
		end
	end

	def reserve
		if user_signed_in? and book.status = "borrowed" or book.status = "renewed"
			book.update!(status: "on queued")
		end
	end

	def search
		if params[:search]
			@books = Book.search(params[:search], operator: "or")
		else
			@books = Book.all
		end
	end

	def return
		book = Book.find(params[:book_id])
		if user.admin? && book.status == "borrowed" or book.status == "renewed"
			@book.update!( status: nil, user_id: nil)
		end

	end

	private
	def book_params
		params.require(:book).permit(:isbn, :title, :author, :publication_date, :cover_url, :summary, :status, :library_id)
	end
	def set_admin
		@admin = user_signed_in? && current_user.admin
	end
	def admin_check
		redirect_to "/" unless @admin
	end

end