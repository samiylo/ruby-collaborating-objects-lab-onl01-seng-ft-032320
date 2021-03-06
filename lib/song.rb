class Song 
  
  attr_accessor :name, :artist 
  
  @@all = []
  def initialize (name)
    @name = name 
    
    @@all << self 
  end
  
  def self.all 
    @@all 
  end
  
  def self.new_by_filename(file_name)
    song = file_name.split(" - ")[1]
    name = file_name.split(" - ")[0]
    new_song = self.new(song)
    new_song.artist_name = name
    new_song
    
  end
  
  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
    
  end
  
  
end