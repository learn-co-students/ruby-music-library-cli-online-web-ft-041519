require 'pry'

class Song
  extend Findable

  attr_accessor :artist

  def initialize(name, *artist)
    self.artist=(artist)
  end

  def artist=(artist)
    artist.add_song(self)
  end

end
