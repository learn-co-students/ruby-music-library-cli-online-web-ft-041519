require_relative "concerns/findable.rb"

class Genre 
  
  attr_accessor :name
  extend Concerns::Findable
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @songs = [] 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def self.create(name)
    genre_name = Genre.new(name)
    genre_name.save 
    genre_name
  end 
  
  def songs 
    @songs 
  end 
  
  def add_song(song)
    @songs << song  if @songs.include?(song) == false 
    song.genre = self if song.genre == nil
  end 

  def artists
    songs.map {|song| song.artist}.uniq
  end
end 