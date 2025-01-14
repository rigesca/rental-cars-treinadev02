class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: [:employee, :admin]

  belongs_to :subsidiary

  def show_role
    if employee?
      "Empregado"
    else
      "Administrador" 
    end
  end
end
