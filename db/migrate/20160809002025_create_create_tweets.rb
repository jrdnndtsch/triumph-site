class CreateCreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
