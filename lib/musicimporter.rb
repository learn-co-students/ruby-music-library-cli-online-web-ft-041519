require 'pry'
class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(path)
    @files.select {|entry| entry.include?("mp3")}
  end 
  
  def import 
    files.each {|x| Song.create_from_filename(x)}
  end  
  
end