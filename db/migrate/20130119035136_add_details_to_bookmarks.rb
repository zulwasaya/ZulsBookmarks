class AddDetailsToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :folder, :string, :default => ' '
    add_column :bookmarks, :create_date, :datetime
    add_column :bookmarks, :visited_date, :datetime
    add_column :bookmarks, :modified_date, :datetime
  end
end
