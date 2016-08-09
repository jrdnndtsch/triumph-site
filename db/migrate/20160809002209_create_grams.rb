class CreateGrams < ActiveRecord::Migration
  def change
    create_table :grams do |t|
      t.string :text
      t.string :image_url

      t.timestamps null: false
    end
  end
end
