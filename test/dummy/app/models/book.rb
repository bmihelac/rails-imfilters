class Book < ActiveRecord::Base
  belongs_to :author

  model_filter :name

  model_filter :published_on, :type => :to_date
  model_filter :published_on, :type => :from_date

  # nested scope
  # scope 'filter_by_author_first_name', lambda {|val| joins(:author).where(
  # 'authors.first_name LIKE(?)', "%%#{val}%%")}
  model_filter [:author, :first_name]
  model_filter [:author, :country, :name]

end
