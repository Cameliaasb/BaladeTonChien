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
    it "assigns @walks and @dog" do
      # Create a user and a dog for the current_user
      user = FactoryBot.create(:user)
      dog = FactoryBot.create(:dog, user: user)
      walk1 = FactoryBot.create(:walk, difficulty: "facile")
      walk2 = FactoryBot.create(:walk, difficulty: "difficile")

      # Visit the index action
      sign_in user
      get :index, params: { dog_id: dog.id }

      # Assert that @walks and @dog are assigned
      expect(assigns(:walks)).to match_array([walk1, walk2])
      expect(assigns(:dog)).to eq(dog)
    end

    it "filters walks based on query parameters" do
      user = FactoryBot.create(:user)
      dog = FactoryBot.create(:dog, user: user)
      walk1 = FactoryBot.create(:walk, difficulty: "facile", duration: 30, distance: 2.5, title: "Park Walk", city: "A")
      walk2 = FactoryBot.create(:walk, difficulty: "difficile", duration: 45, distance: 5.0, title: "Forest Hike", city: "B")

      # Visit the index action with query parameters
      sign_in user
      get :index, params: { dog_id: dog.id, difficulty: "facile", duration: 35, distance: 4.0, query: "Park" }

      # Assert that @walks are filtered based on parameters
      expect(assigns(:walks)).to match_array([walk1])
    end
  end
end
