class Bookmark < ActiveRecord::Base
  attr_accessible :name, :origin, :url
  attr_accessible :folder,:create_date, :visited_date, :modified_date
  serialize :folder
end
