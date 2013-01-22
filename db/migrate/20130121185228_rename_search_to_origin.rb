class RenameSearchToOrigin < ActiveRecord::Migration
  def up
    rename_column :bookmarks, :search, :origin
  end
  def down
    rename_column :bookmarks, :origin, :search
  end
end
