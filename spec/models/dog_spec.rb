require 'rails_helper'

RSpec.describe Dog, type: :model do
  it "All existing dogs have valid attributes" do
    Dog.all.each { |dog| expect(dog).to be_valid }
  end

  it "is not valid without attributes" do
    expect(Dog.new).to_not be_valid
  end

  subject {
    user_test = User.new(username: "Test user", password: "azerty", email: "test@mail.com")
    described_class.new(name: "Test dog", breed: "Test breed", age: 4, size: "Grand",
                        sexe: "Mâle", energy: rand(1..3), neutered: true, user: user_test)
  }

  it "has default values for relations with other dogs" do
    expect(subject.neutered_males).to be false
    expect(subject).to be_valid
  end

  it "needs a user (owner) to be valid" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "is only valid with valid attributes" do
    subject.sexe = "should fail inclusion validation"
    subject.size = "should fail inclusion validation"
    subject.energy = "should fail inclusion validation"
    expect(subject).to_not be_valid
  end
end
