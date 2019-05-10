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
          list_songs_by_artist
        elsif input == "list genre"
          list_songs_by_genre
        elsif input == "play song"
          play_song
      end 
        end 
  end 
  
    def list_songs
      Song.all.sort {|a,b| a.name <=> b.name}.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end 
    end 
    
    def list_artists
      a_sorted = Artist.all.uniq.sort {|a,b| a.name <=> b.name}
      a_sorted.each.with_index(1) do |artist, index| 
        puts "#{index}. #{artist.name}"
      end 
    end 
   
   def list_genres
     g_sorted = Genre.all.uniq.sort {|a,b| a.name <=> b.name}
     g_sorted.each.with_index(1) do |genre, index| 
       puts "#{index}. #{genre.name}"
     end 
   end 
   
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
       if artist = Artist.find_by_name(input)
          artist.songs.sort { |a,b| a.name <=> b.name }.each.with_index(1) do |song, index|
            puts "#{index}. #{song.name} - #{song.genre.name}"
        end 
      end 
  end 

   def list_songs_by_genre 
      puts "Please enter the name of a genre:"
      input = gets.strip
      if genre = Genre.find_by_name(input)
          genre.songs.sort { |a,b| a.name <=> b.name }.each.with_index(1) do |song, index|
            puts "#{index}. #{song.artist.name} - #{song.name}"
      end
      end 
   end 
   
   def play_song
     puts "Which song number would you like to play?"
     input = gets.chomp.to_i

      songs = Song.all
   
      if (1..songs.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end
     puts "Playing #{song.name} by #{song.artist.name}" if song
    end
   
end 
