require 'pry'

class Artist

  @@all = []

  attr_accessor :name, :songs, :genres

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
    @@all << self
  end

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
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    #   if !artist.song.include?(song)
         self.songs << song
    #   end
    end
  end

  def songs
    @songs
  end

  def genres
    Song.all.select do |song|
      song.artist == self
    end
  end

end
