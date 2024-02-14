class RecipeFoodsController < ApplicationController
  before_action :set_recipe, only: %i[new create]

  def new
    @user = User.find(params[:user_id])
    @recipefood = @recipe.recipe_foods.build
  end

  def create
    @recipefood = @recipe.recipe_foods.build(recipe_food_params)
    if @recipefood.save
      redirect_to user_recipe_path(current_user, @recipe), notice: 'Ingredient added successfully.'
    else
      render 'recipes/show'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to user_recipe_path(current_user, @recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
