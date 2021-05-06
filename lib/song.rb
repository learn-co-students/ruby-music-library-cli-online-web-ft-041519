require 'pry'

class Song 
  
  attr_accessor :name, :artist, :genre 
  
  @@all = [] 
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist == nil 
      @artist = artist
    else
      self.artist=(artist)
    end
    if genre == nil 
      @genre = genre
    else
      self.genre=(genre)
    end
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
    song_name = Song.new(name)
    song_name.save 
    song_name
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end 
  
  def genre 
    @genre 
  end 

  def self.find_by_name(name)
    self.all.find {|song| song.name == name} 
  end 
  
  def self.find_or_create_by_name(name) 
    if self.find_by_name(name) == nil 
      Song.create(name)
    else 
      self.find_by_name(name)
    end 
  end 
  
  def self.new_from_filename(filename)
    splits = filename.split(" - ")
    song_name = splits[1]
    artist_name = splits[0]
    genre_name = splits[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre)
  end 
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save 
  end 
end 