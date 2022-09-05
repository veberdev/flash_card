class Deck < ApplicationRecord
  belongs_to :user
  
  has_many :questions

  has_one_attached :deck_image, dependent: :destroy

  validates :name, length: {maximum: 14}, presence: true
  validates :description, presence: true

end
