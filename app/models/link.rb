require 'uri'

class Link < ActiveRecord::Base

  def self.generate_random_shortlink(pool)
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...pool).map { o[rand(o.length)] }.join
  end

  def self.valid?(url)
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    false
  end

  def self.fix_link(url)
    valid?(url) ? url : "http://" + url
  end

  def self.verify_short_url(url)
    verification = find_by(original_url: fix_link(url))
    verification.nil? ? shorten_url(url) : verification
  end

  def self.shorten_url(url)
    if Link.valid?(url)
      short_url = Link.generate_random_shortlink(3)
      @link = Link.create(
                  original_url: url,
                  short_url: short_url)
      @link.save
      @link
    else
      short_url = Link.generate_random_shortlink(3)
      @link = Link.create(
                  original_url: Link.fix_link(url),
                  short_url: short_url)
      @link.save
      @link
    end
  end
end
