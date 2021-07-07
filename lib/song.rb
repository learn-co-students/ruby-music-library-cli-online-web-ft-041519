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
  
  def self.new_from_filename(song2)
    title = song2.split(" - ")
    artist2 = Artist.find_or_create_by_name(title[0])
    genre2 = Genre.find_or_create_by_name(title[2].split(".")[0])
    Song.new(title[1], artist2, genre2)
  end 
  
  def self.create_from_filename(song2)
    self.new_from_filename(song2)
  end 
  
end
  