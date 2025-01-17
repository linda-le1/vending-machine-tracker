class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :machine_snacks
  has_many :snacks, through: :machine_snacks

  def price_average
    snacks.average(:price)
  end

  def snack_count
    snacks.count
  end 
end
