class Menu

  include DataMapper::Resource

  property :id, Serial
  property :event_id, Integer
  property :food_presentation_id, Integer
end
