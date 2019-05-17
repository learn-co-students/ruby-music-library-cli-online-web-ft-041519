require 'pry'
require_relative './concerns/findable'

class Song
  extend Concerns::Findable

	attr_accessor :name, :artist, :genre
	@@all = []
	
	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.genre = genre if genre
		self.artist = artist if artist
	end
	
	def save
		@@all << self
	end
	
	def self.create(name, genre = nil)
		song = Song.new(name, genre)
		song.save
    song	
	end
	
	def artist=(artist)
	  @artist = artist
	  @artist.add_song(self) 
	end
	
	def genre=(genre)
	  @genre = genre
	  @genre.songs << self if !@genre.songs.find{|s| s == self}
	end
	
  def self.new_from_filename(filename)
    
    file = {artist: filename.split(" - ")[0], 
            title: filename.split(" - ")[1], 
            genre: filename.split(" - ")[2].chomp(".mp3")}
    song = Song.new(file[:title], file[:artist], file[:genre])
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
  end
	
	def self.all
		@@all
	end

	def self.destroy_all
		self.all.clear
	end
	
end