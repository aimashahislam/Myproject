class BooksController < ApplicationController
	before_action :find_author, only: [:create, :destroy]

	def new
	end

	def create
		@book = @author.books.create(book_params)
		if (@book =~ nil)
			return redirect_to author_path(@author)
		end
		render 'authors/show' , notice: "Book title cant be empty."
	end

	def destroy

	end

private
	def find_author
		@author = Author.find(params[:author_id])
	end

	def book_params
		params.require(:book).permit(:title, :published_at)
	end
end
