class City
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :venues
end
