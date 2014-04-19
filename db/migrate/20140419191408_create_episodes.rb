class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.references :podcast, index: true

      t.timestamps
    end
  end
end
