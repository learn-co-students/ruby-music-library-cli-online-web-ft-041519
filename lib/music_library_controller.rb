class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    @path = path 
    music_importer = MusicImporter.new(path)
    music_importer.import 
  end
  
  def call
    
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
     user = "nil"
     until user == "exit"
     
     user = gets.chomp
    
      if user == 'list songs'
        long_songs
      elsif user == 'list artists'
        list_artists
      elsif user == 'list genres'
        list_genres
      elsif user == 'list artist'
        list_artist 
      elsif user == 'list'
        list_genre 
      elsif user == 'play song'
        play_song
     end 
    end 
  end 
  
   
end # end of class 