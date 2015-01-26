module FeedsHelper
  def mime_type(episode)
    type = episode.mime_type

    if episode.mime_type == 'audio/mp3' # what chrome/opera upload as
      'audio/mpeg' # what instacast understands
    else
      type
    end
  end
end
