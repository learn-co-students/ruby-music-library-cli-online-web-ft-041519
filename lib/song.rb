class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = [] 

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end


  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    self.new(name).tap do|song|
      song.save
    end
  end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end


  def self.find_by_name(name)
    @@all.find {|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name)
  end

  def self.new_from_filename(filename)
    parse = filename.split(" - ")
    song_name = parse[1]
    artist_name = parse[0]
    genre_name = parse[2].gsub(".mp3", "")
    song = Song.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end
end
