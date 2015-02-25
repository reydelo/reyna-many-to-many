class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: :true
  validates :email, :name, :password, presence: :true
  has_many :product_reviews
  has_many :products, through: :product_reviews
  has_many :company_reviews
  has_many :companies, through: :company_reviews
end
