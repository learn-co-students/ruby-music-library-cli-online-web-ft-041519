require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
      artist = Artist.new(name)
      artist.save
      artist
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def genres
    # iterate over the @songs array, using the collect method
     @songs.collect {|song| song.genre}.uniq
  end
  # @songs.collect do |song|
  #   song.genre
  # end

  # updated_array = []
  # songs.each do |song|
  #   updated_array << song.genre
  # end
  # return updated_array
end
