class TrieNode
  attr_accessor :element
  attr_accessor :key

  def add_element(key, value)
    @children << TrieNode.new(key[0]) unless @children.any? { |child| child.key == key[0] }
    @children.each do |child|
      if child.key == key
        child.element = value
      elsif child.key == key[0]
        child.add_element(key[1..-1], value)
      end
    end
    nil
  end

  def get_element(key)
    node = find_node(key)
    node ? node.element : nil
  end

  def delete_element(key)
    node = find_node(key)
    node.element = nil if node
  end

  def find_node(key)
    @children.each do |child|
      if child.key == key
        return child
      elsif child.key == key[0]
        return child.find_node key[1..-1]
      end
    end
    nil
  end

  protected

  def initialize(key, value = nil)
    @element = value
    @key = key
    @children = []
  end

end