class LinksController < ApplicationController
  def goto
    @link = Link.find_by(short_url: params[:shortlink])
    redirect_to(@link.original_url)
  end

  def home

  end

  def shortener
    @link = Link.verify_short_url(params[:original_url])
  end
end
