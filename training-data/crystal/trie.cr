class TrieNode
  property children = {} of Char => TrieNode
  property is_end = false
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word : String)
    node = @root
    word.each_char do |ch|
      node = (node.children[ch] ||= TrieNode.new)
    end
    node.is_end = true
  end

  def find_node(word : String) : TrieNode?
    node = @root
    word.each_char do |ch|
      next_node = node.children[ch]?
      return nil unless next_node
      node = next_node
    end
    node
  end

  def contains?(word : String) : Bool
    node = find_node(word)
    !node.nil? && node.is_end
  end

  def starts_with?(prefix : String) : Bool
    !find_node(prefix).nil?
  end
end

trie = Trie.new
["cat", "car", "cart", "dog"].each { |w| trie.insert(w) }

puts trie.contains?("car")
puts trie.contains?("ca")
puts trie.starts_with?("ca")
puts trie.starts_with?("do")
puts trie.starts_with?("z")
