class Artist 
  
  attr_accessor :name, :songs 
  
  @@all = []
  
  def initialize (name)
    @name = name 
    @@all << self 
    
    @songs = []
    
  end
  
  def self.all 
    @@all 
  end
  
  def add_song (song)
    @songs << song 
    song.artist = self
    @@all << self
  end
  
  def self.find_or_create_by_name (name)
    found_artist = self.all.find {|artist| artist.name == name}
    if found_artist
      found_artist
    else
      new_artist = self.new(name)
      @@all << self
      new_artist
    end
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  
  
  
  
  
  
end