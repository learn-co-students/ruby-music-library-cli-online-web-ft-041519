require 'pry'

class Song
  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist.nil?
    self.genre=(genre) unless genre.nil?
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap do |inst|
      inst.name = name
      inst.save
    end
  end

  def artist=(artist)
    artist.add_song(self)
  end

  def genre=(genre)
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.find { |obj| obj.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")
    self.find_or_create_by_name(split[1]).tap do |song|
      song.artist = Artist.find_or_create_by_name(split[0])
      song.genre = Genre.find_or_create_by_name(split[2].chomp(".mp3"))
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
