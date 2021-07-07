require_relative "../config/environment.rb"
require_relative "../lib/concerns/findable.rb"


class Artist
  
  extend Concerns::Findable
  
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
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end 
  
  def genres
    Song.all.select{|x| x.artist == self}.collect{|x| x.genre}.uniq
  end
  
end
  