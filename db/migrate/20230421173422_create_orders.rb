class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.string :city
      t.string :country
      t.string :zip_code
      t.decimal :total

      t.timestamps
    end
  end
end
