class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.string :description
      t.date :expected_on
      t.text :details
      t.integer :user

      t.timestamps
    end
  end
end
