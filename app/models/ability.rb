class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Recipe, user_id: user.id
      can :manage, Food, user_id: user.id
      can :manage, RecipeFood, recipe: { user_id: user.id }
      can :create, Recipe
      can :create, Food
      can :destroy, Recipe do |recipe|
        recipe.user == user
      end
      can :destroy, Food do |food|
        food.user == user
      end
      can :destroy, RecipeFood do |recipe_food|
        recipe_food.recipe.user == user
      end
    end
  end
end
