require 'rails_helper'

RSpec.describe 'People', type: :system do
  # before do
  #   driven_by(:rack_test)
  # end

  describe 'Create a person entry' do
    scenario 'should be succesful' do
      visit new_person_path
      expect(page).to have_content 'Old Form..'
      fill_in 'First name', with: 'Subject'
      fill_in 'Last name', with: 'Test'
      fill_in 'Email', with: 'test@example.com'
      expect { click_button 'Create Person' }.to change(Person, :count).by 1
      expect(page).to have_content 'Person was successfully created'
    end

    context 'with the new person form' do
      before { Flipper[:new_people_form].enable }

      scenario 'should be succesful' do
        visit new_person_path
        expect(page).to have_content 'New Form...'
        fill_in 'First name', with: 'Subject'
        fill_in 'Last name', with: 'Test'
        fill_in 'Email', with: 'test@example.com'
        expect { click_button 'Create Person' }.to change(Person, :count).by 1
        expect(page).to have_content 'Person was successfully created'
      end
    end
  end
end
