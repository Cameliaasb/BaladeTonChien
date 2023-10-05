require 'rails_helper'

RSpec.describe Walk, type: :model do
  it 'factory creates a valid walk' do
    walk = FactoryBot.create(:walk)
    expect(walk).to be_valid
  end

  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:duration) }
  it { should validate_presence_of(:description) }
end
