class Deck < ApplicationRecord
  belongs_to :user
  
  has_many :questions

  has_one_attached :deck_image, dependent: :destroy
end
