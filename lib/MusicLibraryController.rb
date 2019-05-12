class MusicLibraryController

  attr_reader :path

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
    4.times {input = gets}
  end

  def list_songs
    song_arr = []
    Song.all.each do |song|
      song_arr << song.name
    end
    song_arr.sort!
    num = 0
    song_arr.each do |song_name|
      full_song = Song.find_by_name(song_name)
      num += 1
      puts "#{num}. #{full_song.artist.name} - #{full_song.name} - #{full_song.genre.name}"
    end
  end

  def list_artists
    artist_arr = []
    artist.all.each do |artist|
      artist_arr << artist.name
    end
    artist_arr.sort!
    num = 0
    artist_arr.each do |artist_name|
      full_artist = artist.find_by_name(artist_name)
      num += 1
      puts "#{num}. #{full_artist.artist.name} - #{full_artist.name} - #{full_artist.genre.name}"
    end
  end

end
