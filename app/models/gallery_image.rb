class GalleryImage

  include DataMapper::Resource

  property :id, Serial
  property :image_public_id, String
  property :image_format, String
  property :title, String
  property :description, String
end
