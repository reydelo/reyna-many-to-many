class ProductReview < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :title, :description, :product_id, :user_id, :rating, presence: :true
end
