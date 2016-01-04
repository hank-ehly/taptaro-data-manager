class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @category_items = CategoryItem.where(category_id: params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfully created."
      redirect_to @category
    else
      render :new, notice: @category.errors
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category was successfully updated."
      redirect_to @category
    else
      render :edit, notice: @category.errors
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Category was successfully destroyed."
    redirect_to categories_url
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end

end
