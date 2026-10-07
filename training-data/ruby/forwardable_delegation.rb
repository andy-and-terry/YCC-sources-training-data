require 'forwardable'

class Playlist
  extend Forwardable

  def_delegators :@songs, :size, :each, :first, :last
  def_delegator :@songs, :push, :add

  include Enumerable

  def initialize
    @songs = []
  end
end

playlist = Playlist.new
playlist.add('Song A')
playlist.add('Song B')
playlist.add('Song C')

puts "size: #{playlist.size}"
puts "first: #{playlist.first}"
puts "titles: #{playlist.map(&:upcase).join(', ')}"
