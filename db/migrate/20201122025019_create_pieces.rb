class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :category
      t.string :style
      t.integer :quantity
      t.belongs_to :room, null: false, foreign_key: true
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
