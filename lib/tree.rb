class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    if arr.is_a?(Array)
      @arr = arr
      @arr.sort!.uniq!
      @root = build_tree(@arr)
    else
      p "Enter an array please!"
    end
  end

  def build_tree(arr)
    return if arr.empty?

    mid = (arr.length - 1) / 2
    root = Node.new(arr[mid])
    root.left_child = build_tree(arr[0...mid])
    root.right_child = build_tree(arr[(mid + 1)...])
    root
  end

  def insert(value, node = @root)
    # --------  Recursive version  -----------
    return Node.new(value) if node.nil?

    (value < node.data) ? node.left_child = insert(value,
      node.left_child) : node.right_child = insert(value, node.right_child)
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

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left_child = delete(value, node.left_child)
    elsif value > node.data
      node.right_child = delete(value, node.right_child)
    elsif node.right_child.nil?
      tmp = node.left_child
      node = nil
      return tmp
    elsif node.left_child.nil?
      tmp = node.right_child
      node = nil
      return tmp
    else
      # If the value we want to delete has two children, we first go into its right subtree
      tmp = node.right_child
      # Then, keep looking until we find its inorder successor (next biggest value from the one we want to delete, that is the leftmost leaf of the right subtree from the node's value that we want to delete)
      until tmp.left_child.nil?
        tmp = tmp.left_child
      end

      node.data = tmp.data
      node.right_child = delete(tmp.data, node.right_child)
    end
    node
  end

  def find(value)
    tmp = @root
    until tmp.nil?
      if value == tmp.data
        return tmp
      elsif value < tmp.data
        tmp = tmp.left_child
      elsif value > tmp.data
        tmp = tmp.right_child
      end
    end

    if tmp.nil?
      "Value not found!"
    end
  end

  # TODO: Try to implement both iteration and recurstion
  def level_order(node = @root)
    return node if node.nil?

    queue = []
    res = []
    queue << node

    # Recursive
    until queue.empty?
      current = queue.shift
      block_given? ? yield(current) : res << current.data
      queue << (current.left_child) unless current.left_child.nil?
      queue << (current.right_child) unless current.right_child.nil?
    end
    res

    # Iterative
  end

  def preorder
  end

  def inorder
  end

  def postorder
  end

  def height(node)
    return "Enter a node, please." if !node.is_a?(Node)
    # TODO Maybe do smth like check if the left or right value is nil, if it is, go to the opposite side, recursively, thus allowing us to 'cut out' the short paths that are there. do this for both the left and right side, similar approach to the #build_tree method
  end

  def depth
  end

  def balanced?
  end

  def rebalance
    # @to_rebalance.concat(@arr).sort!.uniq!
    self.root = build_tree(@to_rebalance)
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? "│   " : "    "}", false) if node.right_child
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? "    " : "│   "}", true) if node.left_child
  end
end
