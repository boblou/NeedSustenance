class User
  include MongoMapper::Document

  key :name, String
  key :email, String

  many :selections

  validates :email, :uniqueness => { :message => " has already been registered" }

end
