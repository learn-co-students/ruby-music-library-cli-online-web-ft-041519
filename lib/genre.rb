require_relative "../config/environment.rb"
require_relative "../lib/concerns/findable.rb"

class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
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
    genre1 = self.new(name)
    genre1.save 
    genre1
  end 
  
  def artists 
    Song.all.select{|x| x.genre == self}.collect{|x| x.artist}.uniq
  end 
  
end
  