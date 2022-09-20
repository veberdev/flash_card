class Deck < ApplicationRecord
  paginates_per 10

  belongs_to :user

  has_many :questions, dependent: :destroy

  has_one_attached :deck_image, dependent: :destroy

  validates :name, length: { maximum: 13 }, presence: true
  validates :description, presence: true
end
