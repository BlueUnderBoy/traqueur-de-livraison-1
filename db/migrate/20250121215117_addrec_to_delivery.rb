class AddrecToDelivery < ActiveRecord::Migration[7.1]
  def change
    add_column :deliveries, :rec, :string
  end
end
