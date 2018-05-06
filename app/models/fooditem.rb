class Fooditem
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :cuisine, String
  property :desciption, Text
  property :unit_of_issue, String
  property :catagory_id, Integer

  belongs_to :catagory
  has 1, :menu_item

end
