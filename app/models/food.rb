class Food < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :measurement_unit, presence: true
  validates :user_id, presence: true

  has_many :recipe_foods, dependent: :destroy
end
