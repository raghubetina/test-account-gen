class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :email
      t.string :password_digest
      t.boolean :private
      t.text :bio

      t.timestamps
    end
  end
end
