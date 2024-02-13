class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :user_id, presence: true

  has_many :recipe_foods, dependent: :destroy
  def total_price
    recipe_foods.sum { |recipe_food| recipe_food.food.price * recipe_food.quantity }
  end
end
