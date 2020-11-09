require 'rails_helper'

describe BackgroundImageFacade do
  it "returns a relevant image for a given location" do
    location = "denver, co"
    image = BackgroundImageFacade.new(location).image

    expect(image).to be_a(BackgroundImage)
    expect(image.location).to eq(location)
    expect(image.location).to be_a(String)
    expect(image.image_url).to be_a(String)
    expect(image.credit).to be_a(Hash)
    expect(image.credit[:source]).to be_a(String)
    expect(image.credit[:source]).to_not eq(nil)
    expect(image.credit[:author]).to be_a(String)
    expect(image.credit[:author_portfolio]).to be_a(String)
    expect(image.credit[:logo]).to be_a(String)
    expect(image.credit[:logo]).to_not eq(nil)
  end
end
