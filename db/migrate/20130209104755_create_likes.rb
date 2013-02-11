class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :liker_id
      t.string :liker_type
      t.integer :user_id

      t.timestamps
    end
  end
end
