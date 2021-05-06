class MusicLibraryController

  attr_reader :path, :input

  def initialize(path="./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
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
    @input = gets
    3.times {input = gets}
    if @input == "list songs"
      list_songs
    elsif @input == "list artists"
      list_artists
    elsif @input == "list genres"
      list_genres
    elsif @input == "list artist"
      list_songs_by_artist
    elsif @input == "list genre"
      list_songs_by_genre
    elsif @input == "play song"
      play_song
    end
  end

  def list_songs
    song_arr = []
    Song.all.each { |song| song_arr << song.name }
    num = 0
    song_arr.sort!.each do |song_name|
      full_song = Song.find_by_name(song_name)
      num += 1
      puts "#{num}. #{full_song.artist.name} - #{full_song.name} - #{full_song.genre.name}"
    end
  end

  def list_artists
    artist_arr = []
    Artist.all.each { |artist| artist_arr << artist.name }
    num = 0
    artist_arr.sort!.each do |artist_name|
      full_artist = Artist.find_by_name(artist_name)
      num += 1
      puts "#{num}. #{full_artist.name}"
    end
  end

  def list_genres
    genre_arr = []
    Genre.all.each { |genre| genre_arr << genre.name }
    num = 0
    genre_arr.sort!.each do |genre_name|
      full_genre = Genre.find_by_name(genre_name)
      num += 1
      puts "#{num}. #{full_genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets
    artist = Artist.all.detect { |artist| artist.name == user_input }
    if artist != nil
      song_arr = []
      artist.songs.each do |song|
        song_arr << song.name
      end
      num = 0
      song_arr.sort!.each do |song_name|
        num += 1
        puts "#{num}. #{song_name} - #{Song.find_by_name(song_name).genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets
    genre = Genre.all.detect { |genre| genre.name == user_input }
    if genre != nil
      song_arr = []
      genre.songs.each do |song|
        song_arr << song.name
      end
      num = 0
      song_arr.sort!.each do |song_name|
        num += 1
        puts "#{num}. #{Song.find_by_name(song_name).artist.name} - #{song_name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets
    if input != nil
      song_list = Song.all.sort { |a, b| a.name <=> b.name }
      if input.to_i < song_list.length && input.to_i > 0
        index = input.to_i - 1
        if song_list[index] != nil
          puts "Playing #{song_list[index].name} by #{song_list[index].artist.name}"
        end
      end
    end
  end

end
