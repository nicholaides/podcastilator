class AddFilepickerUrlToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :filepicker_url, :string, null: false
  end
end
