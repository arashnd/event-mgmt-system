class Venue
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :city, String
  property :location, String
  property :desciption, Text
  property :capacity, Integer
  property :since, Date
end
