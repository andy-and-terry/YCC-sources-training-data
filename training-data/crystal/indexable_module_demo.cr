# Including Indexable(T) gives a class the whole read-only collection API
# once it defines #size and #unsafe_fetch.
class Playlist
  include Indexable(String)

  def initialize(@songs : Array(String))
  end

  def size : Int32
    @songs.size
  end

  def unsafe_fetch(index : Int) : String
    @songs.unsafe_fetch(index)
  end
end

list = Playlist.new(["intro", "verse", "chorus", "outro"])

puts list[0]
puts list[-1]
puts list[10]?.inspect
puts list.first
puts list.last
puts list.index("chorus")
puts list.includes?("verse")
puts list.map(&.upcase).inspect
puts list.each_with_index.map { |s, i| "#{i}:#{s}" }.to_a.inspect
puts list.reverse_each.to_a.inspect

begin
  list.fetch(99)
rescue ex : IndexError
  puts "IndexError: #{ex.message}"
end
