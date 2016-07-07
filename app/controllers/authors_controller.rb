class AuthorsController < ApplicationController
  def new
    @page_title = "Add New Author"
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = 'Author Created'
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books
  end

  def update
    @author = Author.find(params[:id])

    if @author.update(author_params)
      flash[:notice] = "Author Updated"
      redirect_to @author
    else
      render 'edit'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    flash[:notice] = "Author destroyed successfully."

    redirect_to authors_path
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end