class Event

  include DataMapper::Resource

  property :id, Serial
  property :user_id , Integer
  property :venue_id, Integer
  property :booking_date, Date, required: true
  property :event_type, Enum[:wedding, :birthday], required: true
  property :time_slot, Enum[:morning, :evening, :full_day], required: true
  property :seating_arrangement, Enum[:class, :cluster, :ushaped], required: true

  belongs_to :user
  belongs_to :venue
  has 1, :menu

end
