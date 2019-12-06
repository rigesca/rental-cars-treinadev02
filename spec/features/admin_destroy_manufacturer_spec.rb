require 'rails_helper'

feature 'Admin delete a manufacturer' do
    scenario 'successfully' do
        Manufacturer.create(name: 'Fiat')
                           
        visit manufacturers_path
        click_on 'Fiat'
        click_on 'Remover'

        expect(page).to_not have_content('Fiat')
        expect(page).to have_content('Fabricante removido com sucesso')
    end
end