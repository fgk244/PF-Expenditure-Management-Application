class CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    @category.save!
    redirect_to categories_path
  end

  def index
    @newcategory = Category.new
    @categories = Category.page(params[:page]).per(10)
    categories = @categories
    @categories = current_user.categories

  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end

end
