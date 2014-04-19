class Episode < ActiveRecord::Base
  belongs_to :podcast

  def self.new_from_file_picker(podcast, episodes)
    episodes.values.map do |attributes|
      podcast.episodes.build(
        filepicker_url: attributes[:url],
        file_name:      attributes[:filename],
        mime_type:      attributes[:mimetype],
        size:           attributes[:size],
        is_writeable:   attributes[:isWriteable]
      )
    end
  end
end
