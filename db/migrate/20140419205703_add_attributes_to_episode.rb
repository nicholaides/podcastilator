class AddAttributesToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :file_name,    :string,  null: false
    add_column :episodes, :mime_type,    :string,  null: false
    add_column :episodes, :size,         :integer, null: false
    add_column :episodes, :is_writeable, :boolean, null: false
  end
end
