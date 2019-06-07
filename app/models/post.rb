class Post < ApplicationRecord
  belongs_to :user
  validates :beer_name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :count, presence: true, inclusion:{ in: 1..10}
  validates :drink_date, presence: true
end
