class Restaurant
  include MongoMapper::Document

  key :name, String
  key :rating, Integer
  key :location, String
  key :avgPrice, Float
  key :cuisine, String

  validates :name, :presence => true

end
