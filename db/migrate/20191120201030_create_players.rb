class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :middle_name
      t.text :bio
      t.boolean :a_bool
      t.text :a_text
      t.date :a_date
      t.time :a_time
      t.datetime :a_datetime

      t.timestamps
    end
  end
end
