class Selection
  include MongoMapper::Document

  key :name, String

  belongs_to :user

  key :restaurant_ids , Array
  many :restaurants, :in => :restaurant_ids
  
  validates :name, :presence => true
  validates :name, :uniqueness => { :name => " has already been used" }

  def to_param
  	"#{name}".parameterize
  end

end
