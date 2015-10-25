# implementing a trie - hopefully this is good!

require 'byebug'
require 'set'

# Node Class
class TrieNode
  attr_accessor :children, :value, :end

  def initialize(value = "")
    @children = {}
    @value = value
    @end = false
  end

  def add_child(value, node)
    @children[value] = node
  end

  def get_child(value)
    @children[value]
  end
end

# Trie Class
# #addstring, #has_string?, #print_all_words
class Trie
  attr_accessor :root

  def initialize
    @root = TrieNode.new
    # @dictionary = Set.new
  end

  def add_string(str)
    current = @root
    str.split('').each_with_index do |letter, idx|
      if current.children[letter].nil?
        current.children[letter] = TrieNode.new(letter)
      end
      current = current.children[letter]
      if idx == str.length - 1
        current.end = true
      end
    end

  end

  def has_string?(str)
    current = @root
    str.split('').each_with_index do |letter, idx|
      return false if current.children[letter].nil?
      return false if idx == str.length - 1 && current.children[letter] && !current.children[letter].end
      current = current.children[letter]
    end
    true
  end

  def print_all_words(node = @root, word = "")
    word = word + node.value
    p word if node.end

    node.children.sort.each do |item|
      print_all_words(item[1], word)
    end
    return nil
  end

end
