require 'rails_helper'

feature 'Admin delete a manufacturer' do
    scenario 'successfully' do
        user = create(:user)
        login_as(user)
        
        Manufacturer.create(name: 'Fiat')
                           
        visit manufacturers_path
        click_on 'Fiat'
        click_on 'Remover'

        expect(page).to_not have_content('Fiat')
        expect(page).to have_content('Fabricante removido com sucesso')
    end

    scenario 'and try to delete without login' do
        manufacturer = Manufacturer.create(name: 'Fiat')

        visit manufacturer_path(manufacturer)

        expect(current_path).not_to have_content('Remover')
    end
end