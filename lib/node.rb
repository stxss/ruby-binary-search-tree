# Class that contains a method for the value and next node
class Node
    include Comparable
    attr_accessor :data, :left_child, :right_child
    def initialize(data = nil, left_child = nil, right_child = nil)
      @data = data
      @left_child = left_child
      @right_child = right_child
    end
  end
