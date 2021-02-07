class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    save

  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.new_by_filename(filename)
    song, artist = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = Artist.find_or_create_by_name(artist)
    new_song.save
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by_name(name)
  end
end
