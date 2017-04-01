class SeatingArrangement

  include DataMapper::Resource

  property :id, Serial
  property :type, Enum[:theater, :class, :cluster, :ushaped]
  property :capacity, Integer

end
