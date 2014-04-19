class PodcastsController < ApplicationController
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]

  def index
    @podcasts = current_user.podcasts
  end

  def show
  end

  def new
    @podcast = current_user.podcasts.build
  end

  def edit
  end

  def create
    @podcast = current_user.podcasts.build(podcast_params)

    if @podcast.save
      redirect_to @podcast, notice: 'Podcast was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @podcast.update(podcast_params)
      redirect_to @podcast, notice: 'Podcast was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @podcast.destroy
    redirect_to podcasts_url, notice: 'Podcast was successfully destroyed.'
  end

  private
    def set_podcast
      @podcast = current_user.podcasts.find(params[:id])
    end

    def podcast_params
      params.require(:podcast).permit(:title)
    end
end
