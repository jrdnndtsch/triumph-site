class CreateFacebooks < ActiveRecord::Migration
  def change
    create_table :facebooks do |t|
      t.text :message
      t.string :link
      t.string :image_link
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
