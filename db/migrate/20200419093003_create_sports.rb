class CreateSports < ActiveRecord::Migration[6.0]
  def change
    create_table :sports do |t|
      t.integer :position
      t.text :description

      t.timestamps
    end
  end
end
