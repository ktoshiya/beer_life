class Beer < ApplicationRecord
  has_many :posts
  belong_to :beer_image
end
