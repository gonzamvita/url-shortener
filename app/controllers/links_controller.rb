class LinksController < ApplicationController
  def goto
    @link = Link.find_by(short_url: params[:shortlink])
    redirect_to(@link.original_url)
  end

  def home

  end

  def shortener
    short_url = Link.generate_random_shortlink(3)
    @link = Link.create(
                original_url: params[:original_url],
                short_url: short_url)
    @link.save
  end

end
