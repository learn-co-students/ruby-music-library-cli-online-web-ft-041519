require 'pry'
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    music_library = MusicImporter.new(path).import
    #binding.pry
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
    input = ""
    while input != "exit"
      input = gets.strip.downcase
      case input
        when "list songs"
          list_songs
          puts "What would you like to do?"
        when "list artists"
          list_artists
          puts "What would you like to do?"
        when "list genres"
          list_genres 
          puts "What would you like to do?"
        when "list artist"
          list_songs_by_artist
          puts "What would you like to do?"
        when "list genre"
          list_songs_by_genre
          puts "What would you like to do?"
        when "play song"
          play_song
          puts "What would you like to do?"
      end
    end
  end
  
  def list_songs
    song_list = Song.all.sort_by{|song| song.name}
    song_list.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    artist_list = Artist.all.sort_by{|artist| artist.name}
    artist_list.each_with_index{ |artist, index| puts "#{index + 1}. #{artist.name}"}
  end
  
  def list_genres
    genre_list = Genre.all.sort_by{|genre| genre.name}
    genre_list.each_with_index{ |genre, index| puts "#{index + 1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip
    target_artist = Artist.all.find{|artist| artist.name == artist_input}
    if target_artist
      song_list = target_artist.songs.sort_by{|song| song.name}
      song_list.each_with_index{|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    target_genre = Genre.all.find{|genre| genre.name == genre_input}
    if target_genre
      song_list = target_genre.songs.sort_by{|song| song.name}
      song_list.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_list = Song.all.sort_by{|song| song.name}
    input = gets.strip.to_i
    if (1..song_list.length).include?(input)
      target_song = song_list[input - 1]
      puts "Playing #{target_song.name} by #{target_song.artist.name}"
    end
    
  end

end