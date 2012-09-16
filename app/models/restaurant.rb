class Restaurant
	include MongoMapper::Document

	key :name,		String
	key :rating,	String
	key :distance,	String
	key :price,		String
	key :cuisine,	String

end