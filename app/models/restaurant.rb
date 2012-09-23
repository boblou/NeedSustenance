<<<<<<< HEAD
class Restaurant
  include MongoMapper::Document

  key :name, String
  key :rating, Integer
  key :distance, String
  key :avgPrice, Integer
  key :cuisine, String

end
=======
class Restaurant
	include MongoMapper::Document

	key :name,	String
	key :rating,	String
	key :distance,	String
	key :price,	String
	key :cuisine,	String

end
>>>>>>> dc726ec3d6c6ad434f2205478eb25fd188da60b1
