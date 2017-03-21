class AddGramPhotoAndPublishedToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :gram_photo, :string
    add_column :blogs, :published, :boolean, default: false
  end
end
