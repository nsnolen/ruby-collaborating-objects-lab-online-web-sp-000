require 'pry'
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
    binding.pry
    song, artist = filename.split(" - ")
    song = self.new(song)
    artist = Artist.find_or_create_by_name(artist)
    song.artist = artist
    artist.add_song(song)
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by_name(name)
  end
end
