class FoodPresntation
  include DataMapper::Resource

  property :id, Serial
  property :crockery, Enum[:disposable, :bone_china, :glass, :steel]
  property :type, Enum[:decorated, :simple]
  
end
