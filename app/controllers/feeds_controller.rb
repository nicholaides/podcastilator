class FeedsController < ApplicationController
  layout false

  def show
    @podcast = Podcast.find_by_public_id(params[:id])
  end
end
