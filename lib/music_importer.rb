class MusicImporter
  
  attr_accessor :path 

  def initialize(path)
    @path = path 
  end 
  
  def path 
    @path = path 
  end 

   def files
    @files = Dir.entries(path).select {|file| file.include?("mp3")}
  end 