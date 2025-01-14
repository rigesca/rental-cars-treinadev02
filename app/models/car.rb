class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary

  has_one :car_category, through: :car_model

  has_many :car_rentals
  has_many :rentals, through: :car_rentals

  validates :license_plate, :color, :mileage, presence: {message: 'O campo deve ser preenchido'}
  validates :license_plate, uniqueness: {message: 'Placa já cadastrada'}
  validates :mileage, numericality: {greater_than_or_equal_to: 0, message:'Valor deve ser maior ou igual a zero'} 

  enum status: { availble: 0, unavailble: 5}

  def name
    "#{car_model.name} - #{license_plate}"
  end

  def show_status
    if availble?
      'Disponivel'
    else 
      'Indisponivel'
    end
  end
end
