class Artist 
  extend Concerns::Findable
  attr_accessor :name 
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @@all << self 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def save
    @@all << self     
    self 
  end
  
  def self.destroy_all
    @@all.clear
  end 
      
  def self.create(name) 
    artist = self.new(name)
    artist.save
    artist 
  end 
  
  def genres 
    songs.collect {|song| song.genre}.uniq
    #returns a collection of genres for all of the artist's songs only including uniq genres
  end 
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
    #Passed in song 's artist is equal to self unless it already has an artist.
    #Add the passed in song to songs var unless it already inludes the passed in song.
  end 
  
  def songs 
    @songs 
  end 
end 

  # Artist
  #add_song
      # assigns the current artist to the song's 'artist' property (song belongs to artist) 
      # does not assign the artist if the song already has an artist 
      # adds the song to the current artist's 'songs' collection 
      # does not add the song to the current artist's collection of songs if it already exists therein 
