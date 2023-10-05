require 'rails_helper'

RSpec.describe WalksController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:dog) { FactoryBot.create(:dog, user: user) }
  let(:walk1) { FactoryBot.create(:walk, difficulty: "facile", duration: 30, distance: 2.5, title: "Park Walk") }
  let(:walk2) { FactoryBot.create(:walk, difficulty: "difficile", duration: 45, distance: 5.0, title: "Forest Hike") }

  describe "GET #index" do
    before(:each) do
      sign_in user
      walk1
      walk2
    end

    it "assigns @walks and @dog" do
      get :index, params: { dog_id: dog.id }

      expect(assigns(:walks)).to match_array([walk1, walk2])
      expect(assigns(:dog)).to eq(dog)
    end

    it "filters walks based on query parameters for a specific dog" do
      # Difficulty filter
      get :index, params: { dog_id: dog.id, difficulty: "difficile" }
      expect(assigns(:walks)).to eq([walk2])

      # Duration filter
      get :index, params: { dog_id: dog.id, duration: 40 }
      expect(assigns(:walks)).to eq([walk1])

      # Distance filter
      get :index, params: { dog_id: dog.id, distance: 4 }
      expect(assigns(:walks)).to eq([walk1])

      # Query filter
      get :index, params: { dog_id: dog.id, query: "Hike" }
      expect(assigns(:walks)).to eq([walk2])

      # All filters combined
      get :index, params: { dog_id: dog.id, difficulty: "facile", duration: 40, distance: 4, query: "Walk" }
      expect(assigns(:walks)).to eq([walk1])

      # No matching results
      get :index, params: { dog_id: dog.id, difficulty: "difficile", query: "Park" }
      expect(assigns(:walks).count).to eq(0)
    end
  end
end
