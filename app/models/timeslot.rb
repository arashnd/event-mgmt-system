class Timeslot
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :details, String

end
