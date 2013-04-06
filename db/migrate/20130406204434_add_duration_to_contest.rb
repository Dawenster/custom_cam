class AddDurationToContest < ActiveRecord::Migration
  def change
    add_column :contests, :duration, :integer
  end
end
