class AddTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.timestamps
      t.string :value
      t.boolean :disabled, default: false
    end
  end
end
