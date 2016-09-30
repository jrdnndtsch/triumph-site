class CreateRequestedQuotes < ActiveRecord::Migration
  def change
    create_table :requested_quotes do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :comments

      t.timestamps null: false
    end
  end
end
