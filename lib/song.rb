require 'pry'
class Song 
  
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre
  

  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
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
    Song.new(name).tap {|song| song.save}
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.new_from_filename(filename)
    file_arr = filename.split(" - ")
    new_name = file_arr[1]
    new_artist = Artist.find_or_create_by_name(file_arr[0])
    new_genre = Genre.find_or_create_by_name(file_arr[2].chomp(".mp3"))
    Song.new(new_name, new_artist, new_genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap {|song| song.save}
  end
  
end