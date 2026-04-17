class Api::V1::BooksController < ApplicationController
  before_action :find_book, except: [ :index, :new, :create ]

  def index
    @books = Book.all
    render json: @books
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:success] = "Book successfully created"
      redirect_to @book
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def update
    if @book.update_attributes(params[:book])
      flash[:success] = "Book was successfully updated"
      redirect_to @book
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = "Book was successfully deleted"
      redirect_to @books_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @books_path
    end
  end

  private

    def find_book
      @book = Book.find(params[:id])
    end
end
