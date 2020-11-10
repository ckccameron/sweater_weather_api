require 'rails_helper'

describe "user registration requests" do
  describe "when a user visits the landing page" do
    it "can create/register a new user and generate a unique api key" do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "boom@shakalaka.com",
        "password": "pass123",
        "password_confirmation": "pass123"
      }

      post "/api/v1/users", headers: headers, params: JSON.generate(params)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(response.content_type).to eq("application/json")

      user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user).to have_key(:id)
      expect(user[:id]).to_not eq(nil)

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

    it "returns 401 status code with error message if registrations fails" do
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }

      params = {
        "email": "boom@shakalaka.com",
        "password": "pass123",
        "password_confirmation": "password123"
      }

      post "/api/v1/users", headers: headers, params: JSON.generate(params)

      expect(response.status).to eq(401)
      expect(response.content_type).to eq("application/json")

      error_message = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(error_message).to be_a(Hash)

      expect(error_message).to have_key(:type)
      expect(error_message[:type]).to eq("error")

      expect(error_message).to have_key(:attributes)
      expect(error_message[:attributes]).to be_a(Hash)

      expect(error_message[:attributes]).to have_key(:message)
      expect(error_message[:attributes][:message]).to be_a(String)
      expect(error_message[:attributes][:message]).to eq("Your credentials are bad")
    end
  end
end
