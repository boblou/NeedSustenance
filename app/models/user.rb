class User
  include MongoMapper::Document

  key :name, String
  key :email, String

  many :selections

  validates :name, :presence => true
  validates :email, :presence => true

  validates :email, :uniqueness => { :message => " has already been registered" }

end
