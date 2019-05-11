require_relative "../config/environment.rb"

class Song
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil) 
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre
    self.save
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
    song1 = self.new(name)
    song1.save 
    song1
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(name)
    self.all.find{|x| x.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create(name)
    end 
  end 
  
end
  