class Menu

  include DataMapper::Resource

  property :id, Serial
  property :event_id, Integer
  property :food_presentation_id, Integer

  belongs_to :event
  has n, :menu_items
  has 1, :food_presentation
end
