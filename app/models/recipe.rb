class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :user_id, presence: true

  has_many :recipe_foods, dependent: :destroy
end
