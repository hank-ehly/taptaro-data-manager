class CategoriesController < ApplicationController

    before_action :set_category, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_admin!

    def index
        @categories = Category.all.order(position: :asc)
        @user_messages = UserMessage.all.order(created_at: :desc).page(params[:page]).per(5)
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
        @carousel_image.position = next_available_pos

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

    def sort
        params[:order].each do |key, value|
            puts "******* #{value}"
            Category.find(value[:id]).update_attribute(:position, value[:position])
        end
        render :nothing => true
    end

    private

    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:title, :position)
    end

    def next_available_pos
        pos_arr = Array.new
        Category.all.each do |c|
            pos_arr << c.position
        end
        return pos_arr.blank? ? 0 : pos_arr.max + 1
    end

end
