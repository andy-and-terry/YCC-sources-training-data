class TrieNode
  property children : Hash(Char, TrieNode)
  property is_end : Bool

  def initialize
    @children = {} of Char => TrieNode
    @is_end = false
  end
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word : String)
    node = @root
    word.each_char do |c|
      node = node.children[c] ||= TrieNode.new
    end
    node.is_end = true
  end

  def search(word : String) : Bool
    node = find(word)
    !node.nil? && node.is_end
  end

  def starts_with?(prefix : String) : Bool
    !find(prefix).nil?
  end

  private def find(s : String) : TrieNode?
    node = @root
    s.each_char do |c|
      next_node = node.children[c]?
      return nil if next_node.nil?
      node = next_node
    end
    node
  end
end

trie = Trie.new
["cat", "car", "card"].each { |w| trie.insert(w) }
puts trie.search("car")
puts trie.search("ca")
puts trie.starts_with?("ca")
