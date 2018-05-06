class Venue
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :city_id, Integer
  property :location, String
  property :desciption, Text
  property :capacity, Integer
  property :venue_photo_public_id, String, default: "no-img_hqzv42"
  property :venue_photo_format, String , default: "png"

  has n, :events
  belongs_to :city

end
