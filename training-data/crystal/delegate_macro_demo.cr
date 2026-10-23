class Playlist
  def initialize
    @songs = [] of String
  end

  delegate size, empty?, to: @songs
  delegate :<<, to: @songs
  delegate first, last, to: @songs
end

list = Playlist.new
list << "Intro"
list << "Finale"
puts list.size
puts list.empty?
puts list.first
puts list.last
