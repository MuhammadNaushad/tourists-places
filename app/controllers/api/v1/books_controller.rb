class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [ :show, :update, :destroy  ]

  # GET /api/v1/books
  def index
    books = Book.all
    render json: books, status: :ok
  end

  # GET /api/v1/books/:id
  def show
    render json: @book, status: :ok
  end

  # POST /api/v1/books
  def create
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created
    else
      render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/books/:id
  def update
    if @book.update(book_params)
      render json: @book, status: :ok
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/books/:id
  def destroy
    @book.destroy
    render json: { status: true, message: "Book deleted successfully" }, status: :ok
  end

  private

  # ✅ before_action method
  def set_book
    @book = Book.find_by(id: params[:id])

    unless @book
      render json: { status: false, message: "Book not found" }, status: :not_found
    end
  end

  # ✅ Strong params
  def book_params
    params.require(:book).permit(:name, :author, :publisher)
  end
end
