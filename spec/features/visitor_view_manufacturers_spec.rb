require 'rails_helper'

feature 'Visitor view manufacturers' do
  scenario 'successfully' do
    user = User.create!(email: 'teste@teste.com.br', password:'123456789')
    login_as(user)

    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'

    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    user = User.create!(email: 'teste@teste.com.br', password:'123456789')
    login_as(user)

    Manufacturer.create!(name: 'Fiat')
    Manufacturer.create!(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and no-register manufacturers' do
    user = User.create!(email: 'teste@teste.com.br', password:'123456789')
    login_as(user)
    
    visit root_path
    click_on 'Fabricantes'
    
    expect(page).to have_content('Não possui fabricantes cadastradas.')
  end

end