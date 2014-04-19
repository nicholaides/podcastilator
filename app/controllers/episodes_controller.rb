class EpisodesController < ApplicationController
  before_filter :require_user_signed_in

  def create
    episodes = Episode.new_from_file_picker(podcast, params[:episodes])
    episodes.each(&:save!)
    head :ok
  end

  def destroy
    episode.destroy
    redirect_to podcast
  end

  private

  def podcast
    @podcast ||= current_user.podcasts.find(params[:podcast_id])
  end

  def episode
    @episode ||= podcast.episodes.find(params[:id])
  end
end
