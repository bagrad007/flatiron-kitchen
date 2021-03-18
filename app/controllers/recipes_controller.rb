class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids => [])
  end
end
