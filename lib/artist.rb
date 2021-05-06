require_relative "concerns/findable.rb"

class Artist 
  
  attr_accessor :name
  extend Concerns::Findable
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
    artist_name = Artist.new(name)
    artist_name.save 
    artist_name
  end 
  
  def add_song(song)
    @songs << song if @songs.include?(song) == false 
    song.artist = self if song.artist == nil
  end 
  
  def songs 
    @songs 
  end 
  
  def genres 
    songs.map {|song| song.genre}.uniq
  end
end 