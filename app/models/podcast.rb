class Podcast < ActiveRecord::Base
  belongs_to :user
  has_many :episodes

  def episode_urls
  end
end
