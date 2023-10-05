require 'rails_helper'

RSpec.describe Dog, type: :model do
  it "is not valid without attributes" do
    expect(Dog.new).to_not be_valid
  end

  it 'factory creates a valid dog' do
    dog = FactoryBot.create(:dog, user: FactoryBot.create(:user))
    expect(dog).to be_valid
    expect(dog.neutered_males).to be false
  end

  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:sexe) }
  it { should validate_presence_of(:size) }
  it { should validate_presence_of(:energy) }

  it "is not valid with invalid values" do
    dog = FactoryBot.build(:dog, energy: "invalid", sexe: "invalid", size: "invalid")
    expect(dog).not_to be_valid
    expect(dog.errors[:energy]).to include("is not included in the list")
    expect(dog.errors[:sexe]).to include("is not included in the list")
    expect(dog.errors[:size]).to include("is not included in the list")
  end
end
