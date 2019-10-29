require 'rails_helper'

RSpec.describe Person, type: :model do
  subject { build_stubbed :person }

  it 'responds to #first_name' do
    is_expected.to respond_to :first_name
  end

  it 'responds to #last_name' do
    is_expected.to respond_to :last_name
  end

  it 'responds to #email' do
    is_expected.to respond_to :email
  end

  describe 'validations' do
    subject { build :person }
    it 'validates the uniqueness of email' do
      is_expected.to validate_uniqueness_of(:email)
    end
  end
end
