require_relative './concerns/findable'

class Artist
  extend Concerns::Findable

	attr_accessor :name, :songs
	@@all = []
	
	def initialize(name)
		@name = name
		@songs = []
	end
	
	def save
		@@all << self
	end
	
	def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
	end
	
	def self.all
		@@all
	end

	def self.destroy_all
		self.all.clear
	end
	
	def add_song(song)
	  @songs << song if !@songs.find{|s| s == song}
	  song.artist = self if !song.artist 
	end
	
	def genres 
	  @songs.collect{|song| song.genre}.uniq
	end
	
end