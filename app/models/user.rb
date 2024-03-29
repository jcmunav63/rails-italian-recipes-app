class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true

  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy

  # User::Roles
  enum role: %i[default admin].freeze

  def admin?
    role == 'admin'
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
