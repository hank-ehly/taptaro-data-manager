class CategoryItemsController < ApplicationController

  before_action :set_category
  before_action :set_category_item, only: [:show, :edit, :update, :destroy]

  def index
    @category_items = CategoryItem.where(category_id: params[:id])
  end

  def show
  end

  def new
    @category_item = @category.category_items.new
  end

  def edit
  end

  def create
    @category_item = @category.category_items.new(category_item_params)
    if @category_item.save
      flash[:success] = 'Category item was successfully created.'
      redirect_to @category
    else
      render :new
    end
  end

  def update
    if @category_item.update(category_item_params)
      flash[:success] = 'Category item was successfully updated.'
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category_item.destroy
    flash[:success] = 'Category item was successfully destroyed.'
    redirect_to @category
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_category_item
    @category_item = CategoryItem.where(category: @category, id: params[:id]).take
  end

  def category_item_params
    params.require(:category_item).permit(:romaji, :kana, :title, :category_id, :female_audio_clip, :male_audio_clip)
  end

end
