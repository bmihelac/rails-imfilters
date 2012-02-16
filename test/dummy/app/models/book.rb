class Book < ActiveRecord::Base
  belongs_to :author
  model_filter :name
  model_filter [:author, :first_name]
  model_filter [:author, :country, :name]

end
