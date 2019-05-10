require 'pry'
class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    import_songs = MusicImporter.new(path)
    import_songs.import 
  end 
  
  def call 
    input = ""
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
    
        until input == "exit"
        input = gets.strip
        if input == "list songs"
          list_songs
        elsif input == "list artists"
          list_artists
        elsif input == "list genres"
          list_genres
        elsif input == "list artist"
          list_artist
        elsif input == "list genre"
          list_genre
      end 
        end 
  end 
  
    def list_songs
      Song.all.sort {|a,b| a.name <=> b.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end 
    end 
    
    def list_artists
      a_sorted = Artist.all.sort {|a,b| a.name <=> b.name}
      a_sorted.each.with_index do |artist, index| 
        puts "#{index}. #{artist.name}"
      end 
    end 
   
   def list_genres
    # binding.pry 
     g_sorted = Genre.all.sort {|a,b| a.name <=> b.name}
     g_sorted.each_with_index do |genre, index| 
       puts "#{index}. #{genre.name}"
     end 
   end 
   
  def list_songs_by_artist
    puts "Please enter the name of an aritst:"
    input = gets.strip
    
  end 

   
   def list_songs_by_genre 
      puts "Please enter the name of a genre:"
      input = gets.strip
   end 
   
   def play_song
   end 
end 
