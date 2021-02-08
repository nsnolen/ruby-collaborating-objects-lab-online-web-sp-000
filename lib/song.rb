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
    artist = Artist.find_or_create_by_name(split_name[0])
    song.artist = artist
    artist.all = song
    song.save
  end

#  def artist_name=(artist)
  #  split_name = filename.split(" - ")
  #  artist = Artist.find_or_create_by_name(split_name[0])
#  artist.add_song(split_name[1])
  #end
end
