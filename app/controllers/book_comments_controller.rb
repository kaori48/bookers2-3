class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		@book_new = Book.new
		@book_comment = @book.book_comments.new(book_comment_params)
		@book_comment.user_id = current_user.id
		if @book_comment.save
			flash[:success] = "Comment created."
			redirect_to book_path(@book)
		else
			@book_comments = BookComment.where(book_id: @book.id)
			render '/books/show'
		end
	end

	def destroy
		@book_comment = BookComment.find(params[:book_id])
		if @book_comment.user != current_user#bookコメントに紐づいたユーザーがログインしてる本人
			redirect_to request.referer#ひとつ前のURLを返す
		end
		@book_comment.destroy#削除
		redirect_to request.referer#ひとつ前のURLを返す
	end

private

def book_comment_params
	params.require(:book_comment).permit(:comment)
end
end

