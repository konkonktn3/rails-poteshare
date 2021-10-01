class AddPostIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations,:post_id,:integer
  end
end
