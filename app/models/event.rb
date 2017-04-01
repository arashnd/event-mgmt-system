class Event

  include DataMapper::Resource

  property :id, Serial
  property :user_id , Integer
  property :venue_id, Integer
  property :event_type, Enum[:wedding, :birthday]
  property :date, Date
  property :slot, Enum[:morning, :evening, :full_day]

  belongs_to :user
  belongs_to :venue
  has 1, :menu
end
