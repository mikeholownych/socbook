class SocBooksController < ApplicationController
  before_action :set_soc_book, only: [:show, :edit, :update, :destroy]

  # GET /soc_books
  # GET /soc_books.json
  def index
    @soc_books = current_user.soc_books
  end

  # GET /soc_books/1
  # GET /soc_books/1.json
  def show
  end

  # GET /soc_books/new
  def new
    @soc_book = current_user.soc_books.new
  end

  # GET /soc_books/1/edit
  def edit
  end

  # POST /soc_books
  # POST /soc_books.json
  def create
    @soc_book = current_user.soc_books.new(soc_book_params)

    respond_to do |format|
      if @soc_book.save
        format.html { redirect_to @soc_book, notice: 'Social Bookmark was successfully created.' }
        format.json { render action: 'show', status: :created, location: @soc_book }
      else
        format.html { render action: 'new' }
        format.json { render json: @soc_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /soc_books/1
  # PATCH/PUT /soc_books/1.json
  def update
    respond_to do |format|
      if @soc_book.update(soc_book_params)
        format.html { redirect_to @soc_book, notice: 'Social bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @soc_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /soc_books/1
  # DELETE /soc_books/1.json
  def destroy
    @soc_book.destroy
    respond_to do |format|
      format.html { redirect_to soc_books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_soc_book
      @soc_book = SocBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def soc_book_params
      params.require(:soc_book).permit(:url, :user_id, :topics[])
    end
end
