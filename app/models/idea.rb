class Idea < ApplicationRecord
  has_many  :idea_categories, dependent: :destroy
  has_many  :categories, through: :idea_categories
  belongs_to :category
  validates :body, presence: true
end