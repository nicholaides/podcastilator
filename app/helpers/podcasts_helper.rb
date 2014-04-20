module PodcastsHelper
  def scheme_options
    Podcast::SCHEMES.map do |scheme, desc|
      ["#{desc} (#{scheme}://)", scheme]
    end
  end
end
