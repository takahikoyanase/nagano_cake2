class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :total_payment
      t.integer :shipping_cost
      t.integer :payment_method
      t.integer :status
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :address_id

      t.timestamps
    end
  end
end
