class IdeasController < ApplicationController

  def index
    @categories = Category.all
    @ideas = Idea.all
  end


end
