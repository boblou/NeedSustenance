class Selection
  include MongoMapper::Document

  key :content, String
  key :user_id, Integer

end
