class CompanyReviewsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @company_review = CompanyReview.new
  end

  def create
    @company  = Company.find(params[:company_id])
    if current_user
      @company_review = CompanyReview.new(company_review_params)
      @company_review.company_id = @company.id
      @company_review.user_id = current_user.id
      if @company_review.save
        redirect_to company_path(@company)
      else
        redirect_to new_company_company_review_path(@company), notice: "Form is invalid"
      end
    else
      redirect_to login_path, notice: "Must be logged in to review a company"
    end
  end

  private
  def company_review_params
    params.require(:company_review).permit(:title, :description, :rating)
  end

end
