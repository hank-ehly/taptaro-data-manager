class CategoryItemsController < ApplicationController
  before_action :set_category_item, only: [:show, :edit, :update, :destroy]

  # GET /category_items
  # GET /category_items.json
  def index
    @category_items = CategoryItem.where(category_id: params[:id])
  end

  # GET /category_items/1
  # GET /category_items/1.json
  def show
  end

  # GET /category_items/new
  def new
    @category = Category.find(params[:category_id])
    @category_item = @category.category_items.new
  end

  # GET /category_items/1/edit
  def edit
    @category = Category.find(params[:category_id])
  end

  # POST /category_items
  # POST /category_items.json
  def create
    @category_item = CategoryItem.new(category_item_params)
    @category_item.category = Category.find(params[:category_id])

    respond_to do |format|
      if @category_item.save
        format.html { redirect_to @category_item, notice: 'Category item was successfully created.' }
        format.json { render :show, status: :created, location: @category_item }
      else
        format.html { render :new }
        format.json { render json: @category_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_items/1
  # PATCH/PUT /category_items/1.json
  def update
    respond_to do |format|
      if @category_item.update(category_item_params)
        format.html { redirect_to @category_item, notice: 'Category item was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_item }
      else
        format.html { render :edit }
        format.json { render json: @category_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_items/1
  # DELETE /category_items/1.json
  def destroy
    @category_item.destroy
    respond_to do |format|
      format.html { redirect_to category_items_url, notice: 'Category item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_item
      @category_item = CategoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_item_params
      params.require(:category_item).permit(:romaji, :kana, :title, :category_id)
    end
end
