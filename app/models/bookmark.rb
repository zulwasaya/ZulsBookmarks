class Bookmark < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :origin, :url, :user
  attr_accessible :folder,:create_date, :visited_date, :modified_date
  serialize :folder
  before_save do |link|
    link.url = "http://#{url}" unless link.url=~/^https?:\/\//
  end
end
