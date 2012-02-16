class Book < ActiveRecord::Base
  belongs_to :author
  model_filter :name
  model_filter :published_on, :type => :to_date
  model_filter :published_on, :type => :from_date
  model_filter [:author, :first_name]
  model_filter [:author, :country, :name]

end
