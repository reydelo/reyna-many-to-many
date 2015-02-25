class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end


    def create
      @company = Company.new(company_params)
      if @company.save
        redirect_to companies_path
      else
        redirect_to new_company_path, notice: 'Company form invalid'
      end
    end

    private
    def company_params
      params.require(:company).permit(:name, :catch_phrase, :suffix)
    end

end
