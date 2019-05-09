class Song 
   attr_accessor :name, :artist, :genre  
  @@all = [] 
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    @@all << self 
    self.artist=artist if artist 
    self.genre=genre if genre 
    #initialize artist= and genre= method if artist and/or genre are passed in 
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
      
  def self.create(song, artist=nil, genre=nil) 
    new_song = self.new(song, artist, genre)
    new_song.save
    new_song 
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    #assigning the passed in artist to the artist attr 
    #calling on the add song method, setting the arg(song) to self. 
    
    #Why does the artist not need to be capitalized when calling on the add_song method?
  end 
  
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    # if genre doesnt include self in songs var then add self
  end 
  
  def find_by_name 
    self.all.detect {|song| song.name == name}   
  end 
  
  def find_or_create_by_name 
    self.all.find {|song| song.name == name} || self.new(name).save  
  end 
  
  end 
  
  
  
  # Song
  #artist=
  #     assigns an artist to the song (song belongs to artist)
  #artist=
    #   invokes Artist#add_song to add itself to the artist's collection of songs(artist has many songs) 
    # #initialize
    #   invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization 
      
end 
