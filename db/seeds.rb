# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   folderArray=['ruby']
   bookmarks= Bookmark.create([{origin: 'ruby on rails',name: 'Ruby on Rails',url: 'http://rubyonrails.org',
                                folder: folderArray,create_date: DateTime.now,visited_date: DateTime.now,modified_date: DateTime.now}])


