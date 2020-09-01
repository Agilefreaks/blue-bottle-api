class AddTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.timestamps
      t.string :value
      t.integer :used_count, default: 0
      t.boolean :disabled, default: false
    end
  end
end
