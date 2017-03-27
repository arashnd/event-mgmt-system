class Venue
  include DataMapper::Resource

  property :id, Serial
  property :city, String
  property :location, String
  property :desciption, Text
  property :capacity, Integer
  property :since, Date
end
