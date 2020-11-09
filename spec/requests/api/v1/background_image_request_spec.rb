require 'rails_helper'

describe "background image requests" do
  describe "when a user visits the landing page" do
    it "can retrieve background image for a given city" do
      city = "denver,co"
      get "/api/v1/background?location=#{city}"

      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")

      denver_image = JSON.parse(response.body, symbolize_names: true)

      expect(denver_image[:data]).to be_a(Hash)

      expect(denver_image[:data]).to have_key(:type)
      expect(denver_image[:data][:type]).to eq("background_image")

      expect(denver_image[:data]).to have_key(:attributes)
      expect(denver_image[:data][:attributes]).to be_a(Hash)

      expect(denver_image[:data][:attributes]).to have_key(:location)
      expect(denver_image[:data][:attributes]).to have_key(:image_url)
      expect(denver_image[:data][:attributes]).to have_key(:credit)
      expect(denver_image[:data][:attributes][:credit]).to be_a(Hash)

      expect(denver_image[:data][:attributes][:location]).to be_a(String)
      expect(denver_image[:data][:attributes][:image_url]).to be_a(String)

      expect(denver_image[:data][:attributes][:credit]).to have_key(:source)
      expect(denver_image[:data][:attributes][:credit]).to have_key(:author)
      expect(denver_image[:data][:attributes][:credit]).to have_key(:author_portfolio)
      expect(denver_image[:data][:attributes][:credit]).to have_key(:logo)

      expect(denver_image[:data][:attributes][:credit][:source]).to be_a(String)
      expect(denver_image[:data][:attributes][:credit][:author]).to be_a(String)
      expect(denver_image[:data][:attributes][:credit][:author_portfolio]).to be_a(String)
      expect(denver_image[:data][:attributes][:credit][:logo]).to be_a(String)
    end

    it "can render bad request error if location is not given" do
      get "/api/v1/background?location="

      bad_request = JSON.parse(response.body, symbolize_names: true)

      expect(bad_request[:data][:type]).to eq("error")
      expect(bad_request[:data][:attributes][:status_code]).to be_an(Integer)
      expect(bad_request[:data][:attributes][:message]).to be_a(String)
    end
  end
end
