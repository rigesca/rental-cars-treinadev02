require 'rails_helper'

feature 'User search rental' do
  scenario 'successfully' do
    user = create(:user)
    login_as(user)

    client = Client.create!(name: 'Fulano', cpf: '000.000.000-00', email: 'fulano@client.com')
    
    car_category = CarCategory.create!(name: 'Carro pequeno', daily_rate: '90', 
                                       car_insurance: '35', third_party_insurance: '29')
    
    rental = Rental.create!(start_date: 1.day.from_now , end_date: 2.day.from_now , client_id:client.id, car_category_id:car_category.id, reservation_code: 'ABC1234')
    rental = Rental.create!(start_date: 1.day.from_now , end_date: 2.day.from_now , client_id:client.id, car_category_id:car_category.id, reservation_code: 'XYZ1234')

    visit root_path
    click_on 'Agendamento de locação de carro'
    fill_in 'Codigo', with: rental.reservation_code
    click_on 'Busca'

    expect(page).to have_content(rental.reservation_code)
    expect(page).to have_content(other_rental.reservation_code)
  end
end