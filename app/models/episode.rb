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

  def title
    file_name.gsub(/\.[^\.]*$/, '')
  end

  before_create :set_order

  def set_order
    self.order = Time.now.to_i
  end

  def self.save_order(episodes)
    transaction do
      episodes.each.with_index do |episode, idx|
        episode.order = idx
        episode.save!
      end
    end
  end
end
