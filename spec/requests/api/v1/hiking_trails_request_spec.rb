require 'rails_helper'

describe "hiking trail requests" do
  describe "when a user visits the landing page" do
    it "can retrieve hiking trails near a given location" do
      city = "denver, co"
      get "/api/v1/trails?location=#{city}"

      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")

      denver_trails = JSON.parse(response.body, symbolize_names: true)

      expect(denver_trails[:data]).to be_a(Hash)

      expect(denver_trails[:data]).to have_key(:attributes)
      expect(denver_trails[:data][:attributes]).to be_a(Hash)

      expect(denver_trails[:data][:attributes]).to have_key(:location)
      expect(denver_trails[:data][:attributes]).to have_key(:forecast)
      expect(denver_trails[:data][:attributes][:forecast]).to be_a(Hash)

      expect(denver_trails[:data][:attributes][:forecast]).to have_key(:summary)
      expect(denver_trails[:data][:attributes][:forecast]).to have_key(:temperature)

      expect(denver_trails[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(denver_trails[:data][:attributes][:forecast][:temperature]).to be_a(Numeric)

      expect(denver_trails[:data][:attributes]).to have_key(:trails)
      expect(denver_trails[:data][:attributes][:trails]).to be_an(Array)

      expect(denver_trails[:data][:attributes][:trails][0]).to have_key(:name)
      expect(denver_trails[:data][:attributes][:trails][0]).to have_key(:summary)
      expect(denver_trails[:data][:attributes][:trails][0]).to have_key(:difficulty)
      expect(denver_trails[:data][:attributes][:trails][0]).to have_key(:location)
      expect(denver_trails[:data][:attributes][:trails][0]).to have_key(:distance_to_trail)

      expect(denver_trails[:data][:attributes][:trails][0][:name]).to be_a(String)
      expect(denver_trails[:data][:attributes][:trails][0][:summary]).to be_a(String)
      expect(denver_trails[:data][:attributes][:trails][0][:difficulty]).to be_a(String)
      expect(denver_trails[:data][:attributes][:trails][0][:location]).to be_a(String)
      expect(denver_trails[:data][:attributes][:trails][0][:distance_to_trail]).to be_a(String)
    end
  end
end
