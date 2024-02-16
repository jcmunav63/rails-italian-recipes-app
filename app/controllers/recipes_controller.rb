class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @recipes = @user.recipes.includes(:user).all.paginate(page: params[:page], per_page: 3) # preload all users
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

  def public_recipes
    @public_recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
    .paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = current_user
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:id]) # Preload recipe_foods
    @recipefoods = @recipe.recipe_foods
  end

  def generate_shopping_list
    @recipe = Recipe.find(params[:id])
    @missing_food_items = find_missing_food_items(@recipe)
    @total_food_to_buy = @missing_food_items.count
    @total_value_of_food_needed = @missing_food_items.sum { |item| item[:quantity] * item[:price] }
    @missing_food_items = Food.where(id: @missing_food_items.map(&:id)).includes(:user) # Preload users
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def find_missing_food_items(_recipe)
    all_created_foods = current_user.foods.group(:id)
      .select('id, name, SUM(quantity) AS quantity, measurement_unit, price')
    all_recipe_foods = RecipeFood.joins(:recipe).where(recipes: { user_id: current_user.id })
      .group(:food_id)
      .select('food_id, SUM(quantity) AS quantity')
    missing_food_items = []
    all_recipe_foods.each do |recipe_food|
      created_food = all_created_foods.detect { |food| food.id == recipe_food.food_id }
      missing_food_items << created_food if created_food.present? && created_food.quantity < recipe_food.quantity
    end
    missing_food_items
  end
end
