class AddUsersToSellers < ActiveRecord::Migration[5.2]
  def change
    add_reference :sellers, :user, foreign_key: true
  end
end
