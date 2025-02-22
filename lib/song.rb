require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    elsif self.find_by_name(name) == nil 
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort! { |a, b| a.name <=> b.name }
  end

  def self.new_from_filename(filename)
    artist_name, song_name = filename.split(' - ')
    song_name.delete_suffix!(".mp3")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    artist_name, song_name = filename.split(' - ')
    song_name.delete_suffix!(".mp3")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
end
