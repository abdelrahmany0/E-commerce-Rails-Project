class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.string :name
      t.boolean :order_response

      t.timestamps
    end
  end
end
