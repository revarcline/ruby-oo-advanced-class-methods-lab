class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.create_by_name(name)
    song = create
    song.name = name
    song
  end

  def self.new_by_name(name)
    song = new
    song.name = name
    song
  end

  def self.find_by_name(sname)
    all.find { |song| song.name == sname }
  end

  def self.find_or_create_by_name(sname)
    find_by_name(sname) || create_by_name(sname)
  end

  def self.alphabetical
    all.sort_by(&:name)
  end

  def self.new_from_filename(filename)
    piece = filename.split(' - ')
    song = new
    song.name = piece[1].gsub('.mp3', '')
    song.artist_name = piece[0]
    song
  end

  def self.create_from_filename(filename)
    piece = filename.split(' - ')
    song = create
    song.name = piece[1].gsub('.mp3', '')
    song.artist_name = piece[0]
    song
  end

  def self.destroy_all
    all.clear
  end
end
