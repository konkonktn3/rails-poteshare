class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :roomname
      t.string :introduction
      t.integer :price
      t.string :address
      t.binary :image, limit: 1.megabyte

      t.timestamps
    end
  end
end
