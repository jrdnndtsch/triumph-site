class AddExternalLinkToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :external_link, :boolean, default: false
  end
end
