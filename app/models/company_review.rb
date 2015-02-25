class CompanyReview < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  validates :title, :description, :company_id, :user_id, :rating, presence: :true
end
