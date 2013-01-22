class AddDetailsToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :folder, :string, :default => ' '
    add_column :bookmarks, :create_date, :datetime, :default => Time.now
    add_column :bookmarks, :visited_date, :datetime, :default => Time.now
    add_column :bookmarks, :modified_date, :datetime, :default => Time.now
  end

end
