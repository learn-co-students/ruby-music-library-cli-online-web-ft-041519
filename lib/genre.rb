require 'pry'

class Genre
  extend Findable

  attr_accessor :songs

  def initialize
    @songs = []
  end

end
