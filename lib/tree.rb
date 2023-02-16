class Tree
    attr_accessor :arr, :root
    def initialize(arr)
        if arr.is_a?(Array)
            @arr = arr
        else
            p "Enter an array please!"
        end
    end

    # Method to build the tree, returns level-0 root node.
    def build_tree(arr)

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
    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end

end
