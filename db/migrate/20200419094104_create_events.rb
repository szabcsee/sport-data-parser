class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :competition_id
      t.integer :position
      t.text :description

      t.timestamps
    end
  end
end
