require 'rails_helper'

describe "user login requests" do
  describe "when a user visits the landing page" do
    it "can allow a user to login with their valid credentials" do
      headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
      }

      params = {
        "email": "boom@shakalaka.com",
        "password": "pass123"
      }

      post '/api/v1/sessions', headers: headers, params: JSON.generate(params)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.content_type).to include("application/json")

      user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user).to have_key(:id)
      expect(user[:id]).to not_eq(nil)

      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to be_a(Hash)

      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes]).to have_key(:api_key)
      expect(user[:attributes]).to_not have_key(:password)
      expect(user[:attributes]).to_not have_key(:password_confirmation)
      expect(user[:attributes]).to_not have_key(:password_digest)

      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes][:api_key]).to be_a(String)
    end
  end
end
