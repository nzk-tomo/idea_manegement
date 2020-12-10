class Category < ApplicationRecord
  has_many :idea_categories, dependent: :destroy
  has_many :ideas, through: :idea_categories
  has_many :ideas
  validates :name, uniqueness: true, presence: true
  accepts_nested_attributes_for :ideas, allow_destroy: true
end
