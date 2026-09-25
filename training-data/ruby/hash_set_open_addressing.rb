class OpenHashSet
  TOMBSTONE = Object.new.freeze

  attr_reader :size

  def initialize
    @slots = Array.new(8)
    @size = 0
    @used = 0
  end

  def add(key)
    return self if include?(key)

    rehash if (@used + 1) * 2 > @slots.size
    i = key.hash % @slots.size
    i = (i + 1) % @slots.size while @slots[i] && !@slots[i].equal?(TOMBSTONE)
    @used += 1 if @slots[i].nil?
    @slots[i] = key
    @size += 1
    self
  end
  alias << add

  def include?(key) = !find(key).nil?

  def delete(key)
    i = find(key)
    return false unless i

    @slots[i] = TOMBSTONE
    @size -= 1
    true
  end

  private

  def find(key)
    i = key.hash % @slots.size
    @slots.size.times do
      slot = @slots[i]
      return nil if slot.nil?
      return i if !slot.equal?(TOMBSTONE) && slot.eql?(key)

      i = (i + 1) % @slots.size
    end
    nil
  end

  def rehash
    live = @slots.reject { |s| s.nil? || s.equal?(TOMBSTONE) }
    @slots = Array.new(@slots.size * 2)
    @size = @used = 0
    live.each { |k| add(k) }
  end
end

set = OpenHashSet.new
'the quick brown fox jumps over the lazy dog'.split.each { |w| set << w }
set.delete('fox')
p [set.size, set.include?('fox'), set.include?('dog')]
