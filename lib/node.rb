# Class that contains a method for the value and next node
class Node
    include Comparable
    attr_accessor :data, :next_node
    def initialize(data = nil, next_node = nil)
      @data = data
      @next_node = next_node
    end
  end
