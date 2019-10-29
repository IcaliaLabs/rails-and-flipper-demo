require 'rails_helper'

RSpec.describe 'People', type: :system do
  # before do
  #   driven_by(:rack_test)
  # end

  describe 'Create a person entry' do
    scenario 'should be succesful' do
      visit new_person_path
      fill_in 'First name', with: 'Subject'
      fill_in 'Last name', with: 'Test'
      fill_in 'Email', with: 'test@example.com'
      expect { click_button 'Create Person' }.to change(Person, :count).by 1
    end
  end
end
