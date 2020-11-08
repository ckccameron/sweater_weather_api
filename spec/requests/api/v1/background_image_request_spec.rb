require 'rails_helper'

describe "background image requests" do
  describe "when a user visits the landing page" do
    it "can retrieve background image for a given city" do
      city = "denver,co"
      get "/api/v1/backgrounds?location=#{city}"

      expect(response).to be_successful
      expect(response.content_type).to eq("application/json")

      denver_image = JSON.parse(response.body, symbolize_names: true)

      expect(denver_image[:data]).to be_a(Hash)

      expect(denver_image[:data]).to have_key(:type)
      expect(denver_image[:data][:type]).to eq("image")

      expect(denver_image[:data]).to have_key(:attributes)
      expect(denver_image[:data][:attributes]).to be_a(Hash)

      expect(denver_image[:data][:attributes]).to have_key(:image)
      expect(denver_image[:data][:attributes][:image]).to be_a(Hash)

      expect(denver_image[:data][:attributes][:image]).to have_key(:location)
      expect(denver_image[:data][:attributes][:image]).to have_key(:image_url)
      expect(denver_image[:data][:attributes][:image]).to have_key(:credit)
      expect(denver_image[:data][:attributes][:image][:credit]).to be_a(Hash)

      expect(denver_image[:data][:attributes][:image][:location]).to be_a(String)
      expect(denver_image[:data][:attributes][:image][:image_url]).to be_a(String)

      expect(denver_image[:data][:attributes][:image][:credit]).to have_key(:source)
      expect(denver_image[:data][:attributes][:image][:credit]).to have_key(:author)
      expect(denver_image[:data][:attributes][:image][:credit]).to have_key(:logo)

      expect(denver_image[:data][:attributes][:image][:credit][:source]).to be_a(String)
      expect(denver_image[:data][:attributes][:image][:credit][:author]).to be_a(String)
      expect(denver_image[:data][:attributes][:image][:credit][:logo]).to be_a(String)
    end
  end
end
