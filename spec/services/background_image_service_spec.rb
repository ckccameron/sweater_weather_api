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
    binding.pry
    expect(image_data).to have_key(:results)
    expect(image_data[:results]).to be_an(Array)

    expect(image_data[:results][0]).to have_key(:id)
    expect(image_data[:results][0]).to have_key(:created_at)
    expect(image_data[:results][0]).to have_key(:updated_at)
    expect(image_data[:results][0]).to have_key(:description)

    expect(image_data[:results][0][:id]).to be_a(String)
    expect(image_data[:results][0][:created_at]).to be_a(String)
    expect(image_data[:results][0][:updated_at]).to be_a(String)
    expect(image_data[:results][0][:description]).to be_a(String)

    expect(image_data[:results][0]).to have_key(:urls)
    expect(image_data[:results][0][:urls]).to be_a(Hash)

    expect(image_data[:results][0][:urls]).to have_key(:raw)
    expect(image_data[:results][0][:urls]).to have_key(:full)
    expect(image_data[:results][0][:urls]).to have_key(:regular)
    expect(image_data[:results][0][:urls]).to have_key(:small)
    expect(image_data[:results][0][:urls]).to have_key(:thumb)

    expect(image_data[:results][0][:urls][:raw]).to be_a(String)
    expect(image_data[:results][0][:urls][:full]).to be_a(String)
    expect(image_data[:results][0][:urls][:regular]).to be_a(String)
    expect(image_data[:results][0][:urls][:small]).to be_a(String)
    expect(image_data[:results][0][:urls][:thumb]).to be_a(String)

    expect(image_data[:results][0]).to have_key(:links)
    expect(image_data[:results][0][:links]).to be_a(Hash)

    expect(image_data[:results][0][:links]).to have_key(:self)
    expect(image_data[:results][0][:links]).to have_key(:html)
    expect(image_data[:results][0][:links]).to have_key(:download)

    expect(image_data[:results][0][:links][:self]).to be_a(String)
    expect(image_data[:results][0][:links][:html]).to be_a(String)
    expect(image_data[:results][0][:links][:download]).to be_a(String)

    expect(image_data[:results][0]).to have_key(:user)
    expect(image_data[:results][0][:user]).to be_a(Hash)

    expect(image_data[:results][0][:user]).to have_key(:id)
    expect(image_data[:results][0][:user]).to have_key(:username)
    expect(image_data[:results][0][:user]).to have_key(:name)
    expect(image_data[:results][0][:user]).to have_key(:first_name)
    expect(image_data[:results][0][:user]).to have_key(:last_name)
    expect(image_data[:results][0][:user]).to have_key(:twitter_username)
    expect(image_data[:results][0][:user]).to have_key(:portfolio_url)
    expect(image_data[:results][0][:user]).to have_key(:bio)
    expect(image_data[:results][0][:user]).to have_key(:location)
    expect(image_data[:results][0][:user]).to have_key(:links)
    expect(image_data[:results][0][:user]).to have_key(:profile_image)

    expect(image_data[:results][0][:user][:id]).to be_a(String)
    expect(image_data[:results][0][:user][:username]).to be_a(String)
    expect(image_data[:results][0][:user][:name]).to be_a(String)
    expect(image_data[:results][0][:user][:first_name]).to be_a(String)
    expect(image_data[:results][0][:user][:last_name]).to be_a(String)
    expect(image_data[:results][0][:user][:portfolio_url]).to be_a(String)

    expect(image_data[:results][0][:user][:links]).to have_key(:self)
    expect(image_data[:results][0][:user][:links]).to have_key(:html)
    expect(image_data[:results][0][:user][:links]).to have_key(:photos)
    expect(image_data[:results][0][:user][:links]).to have_key(:portfolio)

    expect(image_data[:results][0][:user][:links][:self]).to be_a(String)
    expect(image_data[:results][0][:user][:links][:html]).to be_a(String)
    expect(image_data[:results][0][:user][:links][:photos]).to be_a(String)
    expect(image_data[:results][0][:user][:links][:portfolio]).to be_a(String)
  end
end
