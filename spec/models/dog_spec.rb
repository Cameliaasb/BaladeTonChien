require 'rails_helper'

RSpec.describe Dog, type: :model do
  it "is not valid without attributes" do
    expect(Dog.new).to_not be_valid
  end

  it "all existing dogs are valid" do
    Dog.all.each { |dog| expect(dog).to be_valid }
  end
end
