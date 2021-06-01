class RemoveNameFromSellers < ActiveRecord::Migration[5.2]
  def change
    remove_column :sellers, :name, :string
  end
end
