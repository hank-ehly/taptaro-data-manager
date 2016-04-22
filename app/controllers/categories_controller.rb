class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def index
    @categories = Category.all
    @user_messages = UserMessage.all.order("created_at").page(params[:page]).per(5)
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
      flash[:success] = 'Category was successfully created.'
      redirect_to @category
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category was successfully updated.'
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = 'Category was successfully destroyed.'
    end
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
