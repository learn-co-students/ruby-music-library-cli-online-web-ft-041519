require 'pry'
require_relative './concerns/findable'

class MusicLibraryController
  extend Concerns::Findable
  
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    
    input = "" 
    while input != "exit"
     puts "To list all of your songs, enter 'list songs'."
     puts "To list all of the artists in your library, enter 'list artists'."
     puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     puts "What would you like to do?"
    
      # CLI Commands
  
      input = gets.chomp
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
         play_song
      end
    end
  end
  # CLI Methods
  
  def list_songs
    number = 1
    Song.all.sort_by!{|s| s.name}.each do |song|
      puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      number += 1
    end
  end
  
  def list_artists
    number = 1
    Artist.all.sort_by{|a| a.name}.each do |artist|
      puts "#{number}. #{artist.name}"
      number += 1
    end
  end
  
  def list_genres
    number = 1
    Genre.all.sort_by{|g| g.name}.each do |genre|
      puts "#{number}. #{genre.name}"
      number += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    number = 1
    Artist.find_or_create_by_name(artist).songs.sort_by{|s| s.name}.each do |song|
      puts "#{number}. #{song.name} - #{song.genre.name}"
      number += 1
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    number = 1
    Genre.find_or_create_by_name(genre).songs.sort_by{|s| s.name}.each do |song|
      puts "#{number}. #{song.artist.name} - #{song.name}"
      number += 1
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    songs = Song.all.sort_by!{|s| s.name}
    song_num = gets.chomp.to_i
    if song_num > 0 && song_num <= songs.size
      song = songs[song_num - 1]
      puts "Playing #{song.name} by #{song.artist.name}" 
    end    
  end
  

  
end
  