require 'pry'

class Artist
  extend Findable


  def add_song(song)
    if song.artist == nil
      song.artist = self
      if !artist.song.include?(song)
        artist.songs << song
      end
    end
  end

end
