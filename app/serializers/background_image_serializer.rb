class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :image_url, :credit
end
