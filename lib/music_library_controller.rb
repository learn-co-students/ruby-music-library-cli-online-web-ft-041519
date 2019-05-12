class MusicLibraryController
  
  attr_accessor :path, :store
  
  def initialize(path = './db/mp3s') 
    @path = path 
    music = MusicImporter.new(path)
    music.import
    @store = []
  end 
  
  def call
    
  user_input = 0 
  
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
  puts "To list all of the songs by a particular artist, enter 'list artist'."
  puts "To list all of the songs of a particular genre, enter 'list genre'."
  puts "To play a song, enter 'play song'."
  puts "To quit, type 'exit'."
  puts "What would you like to do?"
  
  until user_input == "exit"
    user_input = gets.chomp 
  end
  
  end 
  
  def list_songs
    music = MusicImporter.new(@path).files.sort_by{|x| x.split(" - ")[1]}
    i = 0
    @store = music.collect do |x| 
      i += 1  
      "#{i}" + ". " + x.split(".")[0] 
    end 
    
    @store.each{|x| puts x }

  end 
  
  def list_artists
    artists = Artist.all.collect{|x| x.name}.sort.uniq 
    i = 0
    artists.collect do |x| 
      i += 1  
      puts "#{i}" + ". " + x
    end
  end 
  
  def list_genres
    genres = Genre.all.collect{|x| x.name}.sort.uniq 
    i = 0
    genres.collect do |x| 
      i += 1  
      puts "#{i}" + ". " + x
    end
  end
  
  def list_songs_by_artist
    
    puts "Please enter the name of an artist:"
    
    user_input = gets.chomp
    
    i=0
    song_list = Song.all.select{|x| x.artist.name == user_input}
    song_list2 = song_list.collect{|x| x.name}
    genre_list = song_list.collect{|x| x.genre.name}
    
    store = []

    song_list2.collect do |x| 
      store[i] = "#{x} - #{genre_list[i]}"
      i+=1
    end
    
    i=0
    
    store = store.sort
    store.each do |x| 
      store[i] = "#{i+1}. #{x}" 
      i+=1
    end 
    
    store.each{|x| puts x}
   
  end 
  
  def list_songs_by_genre
    
    puts "Please enter the name of a genre:"
    
    user_input = gets.chomp
    
    i=0
    song_list = Song.all.select{|x| x.genre.name == user_input}
    song_list2 = song_list.collect{|x| x.name}
    artist_list = song_list.collect{|x| x.artist.name}
    
    store = []

    artist_list.collect do |x| 
      store[i] = "#{x} - #{song_list2[i]}"
      i+=1
    end
    
    i=0
    
    store = store.sort_by{|x| x.split(" - ")[1]}
    store.each do |x| 
      store[i] = "#{i+1}. #{x}" 
      i+=1
    end 
    
    store.each{|x| puts x}
   
  end
  
  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp
    if user_input.to_i.to_s == user_input 
      value = user_input.to_i - 1
      title = @store[value]
      binding.pry
      title = title.split(Regexp.union([". ", " - "]))
      puts "Playing #{title[2]} by #{title[1]}"
    end 
     
  end 
  
end 