# Class representing the Binary Search Tree
class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    if arr.is_a?(Array)
      @arr = arr

      # Before building a tree, sort it out and remove duplicates
      @arr.sort!.uniq!
      @root = build_tree(@arr)
    else
      p "Enter an array please!"
    end
  end

  # Method to build the tree, returns level-0 root node.
  def build_tree(arr)
    return if arr.empty?

    # Find the middle of the array
    mid = (arr.length - 1) / 2

    # Create a new root node for the level
    root = Node.new(arr[mid])

    # Recursively repeat the building of the tree for the children/leaves of the tree
    root.left_child = build_tree(arr[0...mid])
    root.right_child = build_tree(arr[(mid + 1)...])

    root
  end

  # Method to insert into the tree
  def insert(value, node = @root)
    # --------  Recursive version  -----------
    # If the node is nil, create a new node with the pretended value in its place
    return Node.new(value) if node.nil?

    # Ternary operation that executes:
    #  - Is the value given smaller than the current node's data?
    #   - If YES, recursively check the current node's LEFT child and execute insert
    #   - If NO, recursively check the current node's RIGHT child and execute insert
    #  Execute this until the node's value is nil, so the return statement at the top is executed and a value is returned, which in turn is assigned to the respective left or right variable that called it
    value < node.data ? node.left_child = insert(value, node.left_child) : node.right_child = insert(value, node.right_child)

    # Return the node
    node

    # --------  Iterative version  -----------
    # if @root.nil?
    #   @root = Node.new(value)
    # end

    # prev = nil
    # tmp = @root

    # until tmp.nil?
    #   if tmp.data.nil?
    #     tmp = Node.new(value)
    #     break
    #   elsif value < tmp.data
    #     prev = tmp
    #     tmp = tmp.left_child
    #   elsif value > tmp.data
    #     prev = tmp
    #     tmp = tmp.right_child
    #   end
    # end

    # if prev.data > value
    #   prev.left_child = Node.new(value)
    # else
    #   prev.right_child = Node.new(value)
    # end
  end

  # Method to delete from the tree
  def delete
  end

  # Method to find a node with the given value
  def find(value)
    tmp = @root
    # Traverse tree until there is the value is found
    until tmp.nil?
      if value == tmp.data
        return tmp
      elsif value < tmp.data
        tmp = tmp.left_child
      elsif value > tmp.data
        tmp = tmp.right_child
      end
    end

    # If the node is nil, i.e the tree has been completely traversed and no value was identified, return not found message
    if tmp.nil?
      "Value not found!"
    end
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
    return "Enter a node, please." if !node.is_a?(Node)
    # Maybe do smth like check if the left or right value is nil, if it is, go to the opposite side, recursively, thus allowing us to 'cut out' the short paths that are there. do this for both the left and right side, similar approach to the #build_tree method
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
