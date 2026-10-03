class SkipListNode
  attr_accessor :value, :forward

  def initialize(value, level)
    @value = value
    @forward = Array.new(level + 1)
  end
end

class SkipList
  MAX_LEVEL = 4
  P = 0.5

  def initialize
    @head = SkipListNode.new(nil, MAX_LEVEL)
    @level = 0
  end

  def random_level
    lvl = 0
    lvl += 1 while rand < P && lvl < MAX_LEVEL
    lvl
  end

  def insert(value)
    update = Array.new(MAX_LEVEL + 1, @head)
    current = @head

    @level.downto(0) do |i|
      current = current.forward[i] while current.forward[i] && current.forward[i].value < value
      update[i] = current
    end

    new_level = random_level
    if new_level > @level
      (@level + 1..new_level).each { |i| update[i] = @head }
      @level = new_level
    end

    node = SkipListNode.new(value, new_level)
    (0..new_level).each do |i|
      node.forward[i] = update[i].forward[i]
      update[i].forward[i] = node
    end
  end

  def include?(value)
    current = @head
    @level.downto(0) do |i|
      current = current.forward[i] while current.forward[i] && current.forward[i].value < value
    end
    current = current.forward[0]
    !current.nil? && current.value == value
  end
end

list = SkipList.new
[3, 6, 7, 9, 12, 19, 17, 26, 21, 25].each { |v| list.insert(v) }

puts list.include?(19)
puts list.include?(15)
