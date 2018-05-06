class Catagory
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :fooditems
end
