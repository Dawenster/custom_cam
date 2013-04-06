class AddWinningPhotoIdToContest < ActiveRecord::Migration
  def change
    add_column :contests, :winning_photo_id, :integer
  end
end
