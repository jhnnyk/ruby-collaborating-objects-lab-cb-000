class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    find_artist = @@all.detect { |artist| artist.name == name }

    if find_artist == nil
      new_artist = Artist.new(name)
      new_artist.save
      new_artist
    else
      find_artist
    end
  end

  def print_songs
    self.songs.each { |song| puts song.name }
  end

end
