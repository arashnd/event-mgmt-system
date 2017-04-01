class Venue
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :city_id, Integer
  property :location, String
  property :desciption, Text

end
