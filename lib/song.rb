require 'pry'

class Song

  @@all = []

  attr_accessor :name, :artist

  def initialize(name, *artist)
    @name = name
    self.artist=(artist)
    @@all << self
  end

  # def artist=(artist)
  #   artist.add_song(self)
  # end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    artist.add_song(self)
  end

end
