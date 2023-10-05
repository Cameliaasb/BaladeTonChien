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


RSpec.describe WalksController, type: :controller do
  describe "GET #index" do
    # Test cases for the index action
  end

  describe "GET #show" do
    # Test cases for the show action
  end

  describe "GET #home" do
    # Test cases for the home action
  end

  describe "#filter" do
    # Test cases for the filter method
  end

  describe "#insert_markers" do
    # Test cases for the insert_markers method
  end

  # Add more describe blocks for other controller actions and methods as needed.
end
