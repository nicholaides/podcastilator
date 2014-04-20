class PodcastsController < ApplicationController
  before_filter :require_user_signed_in

  before_action :set_podcast, only: [:show, :edit, :update, :destroy, :phone]

  def index
    redirect_to root_url
  end

  def new
    @podcast = current_user.podcasts.build
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

  def phone
    phone = current_user.phone

    if phone.present?
      title = @podcast.title
      url   = feed_url(@podcast.public_id)
      message = "#{title}\n#{url}"

      TWILIO_CLIENT.account.messages.create(
        to: phone,
        body: message,
        from: ENV['TWILIO_FROM_NUMBER']
      )

      redirect_to @podcast, notice: "Sent"
    else
      redirect_to @podcast, alert: "No phone number set"
    end
  end

  private
    def set_podcast
      @podcast = current_user.podcasts.find(params[:id])
    end

    def podcast_params
      params.require(:podcast).permit(:title)
    end
end
