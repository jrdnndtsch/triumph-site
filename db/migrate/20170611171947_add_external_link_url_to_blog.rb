class AddExternalLinkUrlToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :external_link_url, :string
  end
end
