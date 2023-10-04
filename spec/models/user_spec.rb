require 'rails_helper'

RSpec.describe User, type: :model do
  it "All users have dogs" do
    User.all.each { |user| expect(user.dog).to be_true }
  end

  it "All users have valid attributes" do
    User.all.each { |user| expect(user).to be_valid }
  end
end
