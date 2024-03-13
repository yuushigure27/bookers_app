class BooksController < ApplicationController
  def new
    @books = Book.all
    @book = Book.new
  end
  

  def create
  @book = Book.new(book_params)
  
   if @book.save
       redirect_to book_path(@book.id), notice: 'Book was successfully created.'
   else
     @books = Book.all # @booksを定義する
     render :index
   end
  end

  def index
  @books = Book.all
  @book = Book.new
  @books = Book.order(:id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  @book = Book.find(params[:id])
  end

 def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
  else
    render :edit
  end
 end
  
  def destroy
    book = Book.find(params[:id])  
    book.destroy  
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
 end
