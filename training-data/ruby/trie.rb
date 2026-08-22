class TrieNode
  attr_accessor :children, :is_word

  def initialize
    @children = {}
    @is_word = false
  end
end

class Trie
  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    node = @root
    word.each_char do |ch|
      node = (node.children[ch] ||= TrieNode.new)
    end
    node.is_word = true
  end

  def search(word)
    node = find(word)
    !node.nil? && node.is_word
  end

  def starts_with?(prefix)
    !find(prefix).nil?
  end

  private

  def find(s)
    node = @root
    s.each_char do |ch|
      node = node.children[ch]
      return nil if node.nil?
    end
    node
  end
end

trie = Trie.new
%w[cat car card care].each { |w| trie.insert(w) }
puts "#{trie.search('car')} #{trie.search('ca')} #{trie.starts_with?('ca')}"
