require 'pry'

class Song

  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    if @genre == nil
      @genre = genre
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      Song.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    splits = filename.split(" - ")
    song_name = splits[1]
    artist_name = Artist.find_or_create_by_name(splits[0])
    genre_name = Genre.find_or_create_by_name(splits[2].gsub(".mp3", ""))
    song = Song.new(song_name, artist_name, genre_name)
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

end
