class BooksController < ApplicationController


  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
     redirect_to book_path(@book), notice: 'Book was successfully created!'
    else
     render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book1 = Book.new
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless current_user.id == @book.user.id
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
     redirect_to book_path(@book), notice: 'Book was successfully edited!'
   else
     render :edit
     flash.now[:alert] = "error"
   end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully deleted!'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
