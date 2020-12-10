class CategoriesController < ApplicationController

  def index
    @categories=Category.all
  end

  def new
    @category =Category.new
    @idea =@category.ideas.new
  end

  def create
    @category = Category.new(category_params)
    @idea =@category.ideas
    if Category.where(name: @category.name).exists? && @category.ideas[0][:body] != ""
      Category.find_by(name: @category.name).ideas << @idea
      render :index, status: 201
    elsif Category.where(name: @category.name).empty? && @category.ideas[0][:body] != ""
      @category.save
      render :index, status: 201
    else
      render :new, status: 422
    end
  end

  private
  def category_params
    params.require(:category).permit(:name,ideas_attributes:[:body])
  end
end
