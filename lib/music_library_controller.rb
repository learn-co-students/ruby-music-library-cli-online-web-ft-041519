class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = './db/mp3s') 
    @path = path 
    music = MusicImporter.new(path)
    music.import
  end 
  
  def call
    
  user_input = 0 
  
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
  puts "To play a song, enter 'play song'."
  puts "To quit, type 'exit'."
  puts "What would you like to do?"
  
  until user_input == "exit"
    user_input = gets.chomp 
  end
  
  end 
  
  def list_songs
    music = MusicImporter.new(@path).files.sort_by{|x| x.split(" - ")[1]}
    i = 0
    music.collect do |x| 
      i += 1  
      puts "#{i}" + ". " + x.split(".")[0] 
    end 
  end 
  
  def list_artists
    artists = MusicImporter.new(@path).files.collect{|x| x.split(" - ")[0]}.sort.uniq
    i = 0
    
    binding.pry
    artists.collect do |x| 
      i += 1  
      puts "#{i}" + ". " + x
    end
  end 
  
end 