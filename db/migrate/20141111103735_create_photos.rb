class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.string :thumbnail
      t.string :bitmap
      t.string :title
      t.text :description
      t.integer :ownerEvent
      t.datetime :createdDate

      t.timestamps
    end
  end
end
