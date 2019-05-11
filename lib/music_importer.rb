class MusicImporter
  
  attr_accessor :path, :files
  
  def initialize(music_path)
    @path = music_path 
  end 
  
  def files
    @files = Dir.glob("#{path}/*.mp3").collect!{|x| x.sub("#{path}/","")}
  end 
  
  def import
    files.each{|x| Song.create_from_filename(x)} 
  end 
  
end 