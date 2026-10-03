class SkipNode
  property value : Int32
  property forward : Array(SkipNode?)

  def initialize(@value : Int32, level : Int32)
    @forward = Array(SkipNode?).new(level + 1, nil)
  end
end

class SkipList
  MAX_LEVEL = 4

  def initialize
    @head = SkipNode.new(-1, MAX_LEVEL)
    @level = 0
  end

  private def random_level : Int32
    lvl = 0
    while rand < 0.5 && lvl < MAX_LEVEL
      lvl += 1
    end
    lvl
  end

  def insert(value : Int32)
    update = Array(SkipNode?).new(MAX_LEVEL + 1, nil)
    current = @head
    @level.downto(0) do |i|
      while (nxt = current.forward[i]) && nxt.value < value
        current = nxt
      end
      update[i] = current
    end

    lvl = random_level
    if lvl > @level
      (@level + 1..lvl).each { |i| update[i] = @head }
      @level = lvl
    end

    node = SkipNode.new(value, lvl)
    (0..lvl).each do |i|
      node.forward[i] = update[i].not_nil!.forward[i]
      update[i].not_nil!.forward[i] = node
    end
  end

  def contains?(value : Int32) : Bool
    current = @head
    @level.downto(0) do |i|
      while (nxt = current.forward[i]) && nxt.value < value
        current = nxt
      end
    end
    nxt = current.forward[0]
    !nxt.nil? && nxt.value == value
  end
end

list = SkipList.new
[3, 6, 7, 9, 12].each { |v| list.insert(v) }
puts list.contains?(7)
puts list.contains?(8)
