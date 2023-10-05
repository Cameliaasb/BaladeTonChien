require 'rails_helper'

RSpec.describe User, type: :model do
  it 'factory creates a valid user' do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end
end
