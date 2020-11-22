class CreateReferencePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :reference_photos do |t|
      t.string :link
      t.belongs_to :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
