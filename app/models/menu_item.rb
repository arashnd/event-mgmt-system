class MenuItem
  include DataMapper::Resource

  property :id, Serial
  property :menu_id, Integer
  property :quantity, Float
  property :fooditem_id, Integer

  belongs_to :menu
  has 1, :fooditem
end
