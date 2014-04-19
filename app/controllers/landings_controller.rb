class LandingsController < ApplicationController
  def index
    if user_signed_in?
      user_home_page
    else
      public_home_page
    end
  end

  private

  def public_home_page
  end

  def user_home_page
    render :user
  end
end
