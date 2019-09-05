class CreateLeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :leaders do |t|
      t.string :email
      t.string :password_digest
      t.text :bio
      t.boolean :admin
      t.string :username

      t.timestamps
    end
  end
end
