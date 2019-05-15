require 'pry'

class Artist
  
  attr_accessor :name, :songs  
  
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
      @songs << song 
    else # @songs.include?(song)
      song.artist 
    end 
  end 
  
  def genres 
    # binding.pry
    @songs.map do |song|
      song.genre 
    end 
  end 
end 