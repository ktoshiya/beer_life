class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: { maximum: 50 }
  validate :image_size
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
    def image_size
      if image.size > 3.megabytes
        errors.add(:image, "should be less than 3 MB")
      end
    end
end
