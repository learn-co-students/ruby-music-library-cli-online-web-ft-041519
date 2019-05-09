class Genre 
  extend Findable
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
  
  def songs 
    @songs 
  end 
  
  def save
    @@all << self     
    self 
  end
  
  def self.destroy_all
    @@all.clear
  end 
      
  def self.create(name) 
    genre = self.new(name)
    genre.save
    genre 
  end 
  
  def artists 
    songs.collect {|song| song.artist}.uniq
    #returns a collection of artists for all of the genre's songs, only returning uniq artists 
  end 
end 

