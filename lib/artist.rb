class Artist
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
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

  def add_song(song)
    song.instance_variable_set(:@artist, self) if song.artist.nil?
    songs = @songs.find { |track| track == song }
    songs ? songs : @songs << song
  end

  def genres
    @songs.collect { |song| song.genre }.uniq
  end
end
