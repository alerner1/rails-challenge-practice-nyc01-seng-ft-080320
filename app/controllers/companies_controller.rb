class CompaniesController < ApplicationController
  before_action :find_company, only: [:show]

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params[:name])
    if @company.valid?
      @company.save
      redirect_to company_path(@company)
    else
      render :new
    end
  end

  def show
  end

  private

  def find_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, offices_attributes: [ :id,  ])
  end
end