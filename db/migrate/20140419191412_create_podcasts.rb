class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :title
      t.references :user, index: true
      t.string :public_id

      t.timestamps
    end
  end
end
