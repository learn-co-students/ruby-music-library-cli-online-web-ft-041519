require 'pry'

class Artist
  extend Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !songs.include?(song)
      songs << song
      song
    end
  end

  def songs
    @songs
    # Song.all.select do |song|
    #   song.artist == self
    # end
  end

  def genres
    songs.map do |song|
      song.genre
    end.uniq
  end

end
