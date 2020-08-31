class Company < ApplicationRecord
  has_many :offices
  has_many :buildings, through: :offices
  has_many :employees
  accepts_nested_attributes_for :offices

  def total_rent
    building_floors = self.offices.map do |office|
      office.building
    end

    building_floors.sum { |b| b.rent_per_floor }
  end
end
