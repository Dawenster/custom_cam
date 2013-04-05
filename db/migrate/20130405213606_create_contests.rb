class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string  :title
      t.text    :description
      t.integer :category_id
      t.integer :price
      # MISSING DURATION
      t.integer :creator_id

      t.timestamps
    end
  end
end
