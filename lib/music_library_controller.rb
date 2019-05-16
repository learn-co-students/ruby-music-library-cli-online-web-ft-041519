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
        list_songs
      elsif user == 'list artists'
        list_artists
      elsif user == 'list genres'
        list_genres
      elsif user == 'list artist'
        list_songs_by_artist 
      elsif user == 'list genre'
        list_songs_by_genre 
      elsif user == 'play song'
        play_song
     end 
    end 
  end 
  
  def list_songs
   #binding.pry 
    song_list = Song.all.sort { |a, b| a.name <=> b.name }
    song_list.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end 
  
  def list_artists
    artist_list = Artist.all.sort { |a, b| a.name <=> b.name }
    artist_list.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
  end 
  
  def list_genres
    genre_list = Genre.all.sort { |a, b| a.name <=> b.name }
    genre_list.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
  end 
  
  def list_songs_by_artist
    
    puts "Please enter the name of an artist:"
    
    user = gets.chomp
      
  end 
  
  
end # end of class 