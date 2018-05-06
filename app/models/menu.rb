class Menu

  include DataMapper::Resource

  property :id, Serial
  property :event_id, Integer
  property :crockery, Enum[:disposable, :bone_china, :glass, :steel]
  property :presentation, Enum[:decorated, :simple]


  belongs_to :event
  has n, :menu_items

end
