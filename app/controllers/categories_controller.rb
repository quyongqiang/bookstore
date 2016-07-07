class CategoriesController < ApplicationController
  def new
    @page_title = "Add New Category"
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category Created"
      redirect_to categories_path
    else
      render 'new'
    end


  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @books = @category.books
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = "Category Updated"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:notice] = "Category destroyed successfully."

    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
