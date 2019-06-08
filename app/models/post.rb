class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :beer_name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :count, presence: true, inclusion:{ in: 1..10}
  validates :drink_date, presence: true
  validate  :picture_size

  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
