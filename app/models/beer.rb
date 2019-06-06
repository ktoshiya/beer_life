class Beer < ApplicationRecord
  has_many :posts
  belongs_to :beer_image
end
