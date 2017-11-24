class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, uniqueness: true, length: { minimum: 1}
end
