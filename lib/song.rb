require 'pry'

class Song

  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, *artist)#, *genre)
    @name = name
    @artist = artist[0]
    #@genre = genre
    @@all << self
    #self.artist=(artist)
    #self.genre=(genre)
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
      @genre == genre
      genre.songs << self
      if !Artist.genres.include?(genre)
        Artist.genres << self
      end
    end
  end

end
