require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "methods" do
    it "creates a unique api key" do
      user = User.create!(email: "boom@shakalaka.com", password: "123password", password_confirmation: "123password")

      expect(user.api_key.nil?).to eq(false)
      expect(user.api_key).to be_a(String)
    end
  end
end
