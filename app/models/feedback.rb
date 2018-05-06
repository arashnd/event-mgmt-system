class Feedback
  include DataMapper::Resource

  property :id, Serial
  property :user_id, Integer
  property :title, String
  property :statement, Text

  belongs_to :user
end
