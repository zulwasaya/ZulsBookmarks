class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :search
      t.string :name
      t.text :url

      t.timestamps
    end
  end
end
