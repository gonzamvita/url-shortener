class Link < ActiveRecord::Base

  def self.generate_random_shortlink(pool)
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    string = (0...pool).map { o[rand(o.length)] }.join
  end

end
