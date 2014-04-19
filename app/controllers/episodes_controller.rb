class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :edit, :update, :destroy]

  def index
    @episodes = Episode.all
  end

  def show
  end

  def new
    @episode = Episode.new
  end

  def edit
  end

  def create
    episodes = Episode.new_from_file_picker(podcast, params[:episodes])
    episodes.each(&:save!)
    head :ok
  end


  def update
    if @episode.update(episode_params)
      redirect_to @episode, notice: 'Episode was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @episode.destroy
    redirect_to podcast
  end

  private
    def podcast
      @podcast ||= current_user.podcasts.find(params[:podcast_id])
    end

    def set_episode
      @episode = podcast.episodes.find(params[:id])
    end

    def episode_params
      params[:episode]
    end
end
