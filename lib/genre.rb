class Genre
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
    song.instance_variable_set(:@genre, self) if song.genre.nil?
    find_song = @songs.find { |track| track == song }
    find_song ? find_song : @songs << song
  end

  def artists
    @songs.collect { |song| song.artist }.uniq
  end
end
