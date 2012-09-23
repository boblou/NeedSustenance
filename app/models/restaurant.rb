class Restaurant
  include MongoMapper::Document

  key :name, String
  key :rating, Integer
  key :distance, String
  key :avgPrice, Integer
  key :cuisine, String

end
