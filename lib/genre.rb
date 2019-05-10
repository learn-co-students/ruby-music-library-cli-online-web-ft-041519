class Genre

  extend Concerns::Findable
  
  attr_accessor :name 
  
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
    Genre.new(name).tap{ |genre| genre.save}
  end
  
  def songs 
    @songs 
  end
  
  def artists
    self.songs.map{ |song| song.artist}.uniq.tap{|artists| artists}

  end
    
  
end