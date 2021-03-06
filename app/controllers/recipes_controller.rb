class RecipesController < ApplicationController

  def index
    @recipes=Recipe.all
  end
  
  def show
      @recipe=Recipe.find(params[:id])
  end
  
  def new
    @recipe=Recipe.new
  end
  
  def create
    @recipe=Recipe.new(params_allow)
    @recipe.chef=Chef.find(1)
    if @recipe.save
      flash[:success]="Your Recipe was created successfully"
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
    @recipe=Recipe.find(params[:id])
  end
  
  def update
    @recipe=Recipe.find(params[:id])
    if @recipe.update(params_allow)
      flash[:success]="Your Recipe was updated successfully"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  private
    def params_allow
      params.require(:recipe).permit(:name, :summary, :description)
    end

end