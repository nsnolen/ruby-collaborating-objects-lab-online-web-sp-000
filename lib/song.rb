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
    split_name = filename.split(" - ")
    song = self.new(split_name[1])
    artist = self.new(split_name[0])
    song.artist = artist
    artist.song = song
    song
  end

  def artist_name=(artist)
    artist = Artist.find_or_create_by_name(split_name[0])
    self.artist = artist
    artist.add_song(self)
  end
end
