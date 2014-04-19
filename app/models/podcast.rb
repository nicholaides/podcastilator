class Podcast < ActiveRecord::Base
  belongs_to :user
  has_many :episodes

  def episode_urls
  end

  before_create :set_public_id

  def set_public_id
    self.public_id = SecureRandom.hex(20)
  end
end
