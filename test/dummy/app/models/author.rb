class Author < ActiveRecord::Base
  belongs_to :country
  has_many :books
end
