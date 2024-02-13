class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = @user.recipes.includes(:user).paginate(page: params[:page], per_page: 3)
  end

  def new
    @user = current_user
    @recipe = @user.recipes.build
  end

  def create
    @user = current_user
    @recipe = @user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to root_path(@user), notice: 'Recipe was successfully created!'
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to user_recipes_path(@recipe.user), notice: 'Recipe was successfully deleted.'
    else
      redirect_to user_recipes_path(current_user), alert: 'Recipe could not be destroyed.'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
