class CreateOutcomes < ActiveRecord::Migration[6.0]
  def change
    create_table :outcomes do |t|
      t.integer :market_id
      t.text :description

      t.timestamps
    end
  end
end
