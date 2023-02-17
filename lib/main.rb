require_relative "node"
require_relative "tree"

data_arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# data_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

bst = Tree.new(data_arr)
p bst

bst.insert(50)
bst.insert(6436)

p bst.pretty_print

# TODO Write a script that creates a binary search tree from an array of random numbers
# TODO Confirms that the tree is balanced by calling #balanced?
# TODO Prints out all of the elements in level, pre, post and in order
# TODO Unbalance the tree by adding numbers > 100
# TODO Confirm that the tree is unbalanced by calling #balanced?
# TODO Balance the tree by calling #rebalance
# TODO Confirm the tree is balanced by calling #balanced?
# TODO Prints out all of the elements in level, pre, post and in order again
