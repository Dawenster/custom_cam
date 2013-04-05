class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string  :title
      t.text    :description
      t.string  :category
      t.integer :price
      t.integer :creator_id

      t.timestamps
    end
  end
end
