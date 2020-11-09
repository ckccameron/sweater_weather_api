require 'rails_helper'

describe BackgroundImageService do
  before :each do
    @service = BackgroundImageService.new
  end

  it "exists" do
    expect(@service).to be_a(BackgroundImageService)
  end

  it "returns background image for a given location" do
    location = "denver, co"
    image_data = @service.get_image(location)

    expect(image_data).to have_key(:photos)
    expect(image_data[:photos]).to be_an(Array)

    expect(image_data[:photos][0]).to be_a(Hash)
    expect(image_data[:photos][0]).to have_key(:id)
    expect(image_data[:photos][0]).to have_key(:url)
    expect(image_data[:photos][0]).to have_key(:photographer)
    expect(image_data[:photos][0]).to have_key(:photographer_url)
    expect(image_data[:photos][0]).to have_key(:photographer_id)
    expect(image_data[:photos][0]).to have_key(:src)
    
    expect(image_data[:photos][0][:id]).to be_an(Integer)
    expect(image_data[:photos][0][:url]).to be_a(String)
    expect(image_data[:photos][0][:photographer]).to be_a(String)
    expect(image_data[:photos][0][:photographer_url]).to be_a(String)
    expect(image_data[:photos][0][:photographer_id]).to be_an(Integer)

    expect(image_data[:photos][0][:src]).to be_a(Hash)
    expect(image_data[:photos][0][:src]).to have_key(:original)
    expect(image_data[:photos][0][:src]).to have_key(:portrait)
    expect(image_data[:photos][0][:src]).to have_key(:landscape)

    expect(image_data[:photos][0][:src][:original]).to be_a(String)
    expect(image_data[:photos][0][:src][:portrait]).to be_a(String)
    expect(image_data[:photos][0][:src][:landscape]).to be_a(String)
  end
end
