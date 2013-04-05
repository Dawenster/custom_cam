class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :description
      t.string :url
      t.references :contest
      t.references :user
      t.timestamps
    end
  end
end
