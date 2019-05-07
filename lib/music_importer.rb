class MusicImporter
  attr_accessor :path
  attr_writer :files

  def initialize(path)
    @path = path
    @files = Dir.glob("#{path}/*.mp3")
  end

  def files
    @files.collect! { |f| f.gsub("#{@path}/", "") }
  end

  def import
    files.collect { |f| Song.create_from_filename(f) }
  end
end
