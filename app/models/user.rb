class User
  include MongoMapper::Document

  key :name, String
  key :email, String

  many :restaurants

  validates :email, :uniqueness => { :message => " has already been registered" }

end
