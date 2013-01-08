class Bookmark < ActiveRecord::Base
  attr_accessible :name, :search, :url
end
