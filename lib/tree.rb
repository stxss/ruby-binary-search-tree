# Class representing the Binary Search Tree
class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    if arr.is_a?(Array)
      @arr = arr

      first = @arr.find_index(@arr.first) # Index for the first element of a given array
      last = @arr.find_index(@arr.last) # Index for the last element of a given array

      @root = build_tree(@arr, first, last)
    else
      p "Enter an array please!"
    end
  end

  # Method to build the tree, returns level-0 root node.
  def build_tree(arr, start_element, end_element)
    # Before building a tree, sort it out and remove duplicates
    arr.sort!.uniq!

    # If the array traversal has been 'crossed', i.e the index of the start is bigger than the index of the end of the array, return nil, as the end of that particular 'iteration' of the traversal has been reached
    return if start_element > end_element

    # Find the middle of the array
    mid = (start_element + end_element) / 2

    # Create a new root node for the level
    root = Node.new(arr[mid])

    # Recursively repeat the building of the tree for the children/leaves of the tree
    root.left_child = build_tree(arr, start_element, mid - 1)
    root.right_child = build_tree(arr, mid + 1, end_element)

    root
  end

  # Method to insert into the tree
  def insert
  end

  # Method to delete from the tree
  def delete
  end

  # Method to find a node with the given value
  def find(value)
  end

  # Method that accepts a block and traverses the tree in breadth-first level order and yields each node to the provided block.
  # TODO: Try to implement both iteration and recurstion
  def level_order
  end

  # Method for preorder traversion
  def preorder
  end

  # Method for inorder traversion
  def inorder
  end

  # Method for postorder traversion
  def postorder
  end

  # Method that returns the height of the tree, i.e, the edges in the longest path from a given node to a leaf node
  def height(node)
  end

  # Method that accepts a node and returns its depth, i.e, the number of edges in a path from a given node to the tree's root node
  def depth
  end

  # Method to check if a tree is balanced, i.e, if the difference between the heights of the left and right subtrees is no more than 1
  def balanced?
  end

  # Method to rebalance an unbalanced tree
  def rebalance
  end

  # Method to visualize the binary tree
  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? "│   " : "    "}", false) if node.right_child
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? "    " : "│   "}", true) if node.left_child
  end
end
