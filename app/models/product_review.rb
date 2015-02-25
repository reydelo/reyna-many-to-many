class ProductReview < ActiveRecord::Base
  has_many :product
  has_many :user
end
