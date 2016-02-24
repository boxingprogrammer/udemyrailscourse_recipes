class RecipesController < ApplicationController

def index
  @Recipes=Recipe.all
end

def show
    @recipe=Recipe.find(params[:id])
end

end