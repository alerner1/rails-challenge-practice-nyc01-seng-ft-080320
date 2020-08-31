class BuildingsController < ApplicationController
  before_action :find_building, only: [:show, :edit, :update]
  
  def index
    @buildings = Building.all
  end

  def show
  end

  def edit
  end

  def update
    if @building.update(building_params)
      redirect_to building_path(@building)
    else
      render :edit
    end
  end

  private

  def find_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
  end
end