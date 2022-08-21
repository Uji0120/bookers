class BooksController < ApplicationController
  protect_from_forgery
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:success] = 'Book was successfully created'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    Book.order("id")
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
    flash[:success] = 'Book was successfully update'
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    flash[:success] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end

end
