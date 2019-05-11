require_relative "../config/environment.rb"

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
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear
  end
  
  def self.create(name)
    artist1 = self.new(name)
    artist1.save 
    artist1
  end 
  
  def add_song(song)
    if song.artist == nil
      song.artist = self
      song.artist
    end 
    @songs << song unless @songs.include?(song)
  end 
  
  def genres
    Song.all.select{|x| x.artist == self}.collect{|x| x.genre}.uniq
  end
  
end
  