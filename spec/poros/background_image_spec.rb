require 'rails_helper'

describe BackgroundImage do
  before :each do
    @data = {
      :location=>"denver, co",
      :image_url=>"https://www.pexels.com/photo/union-station-building-2706750/",
      :author=>"Thomas Ward",
      :author_portfolio=>"https://www.pexels.com/@thomasleeward"
    }

    @image = BackgroundImage.new(@data)
  end
  
  it "exists with attributes" do
    expect(@image).to be_a(BackgroundImage)
    expect(@image.location).to eq("denver, co")
    expect(@image.image_url).to eq("https://www.pexels.com/photo/union-station-building-2706750/")
    expect(@image.credit).to be_a(Hash)
    expect(@image.credit[:source]).to eq("https://www.pexels.com")
    expect(@image.credit[:author]).to eq("Thomas Ward")
    expect(@image.credit[:author_portfolio]).to eq("https://www.pexels.com/@thomasleeward")
    expect(@image.credit[:logo]).to eq("https://images.pexels.com/lib/api/pexels.png")
  end
end
