class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :wall_color
      t.string :floor_color
      t.string :light
      t.belongs_to :designer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
