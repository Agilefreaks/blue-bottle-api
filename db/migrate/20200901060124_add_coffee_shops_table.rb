class AddCoffeeShopsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :coffee_shops do |t|
      t.timestamps
      t.string :name
      t.decimal :x, precision: 10, scale: 3
      t.decimal :y, precision: 10, scale: 3
    end
  end
end
