class Product < ActiveRecord::Base
  belongs_to :company
  has_many :product_reviews
  has_many :users, through: :product_reviews

  validates :company_id, :name, :price, presence: :true
end
