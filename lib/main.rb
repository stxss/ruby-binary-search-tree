require_relative "node"
require_relative "tree"

# Script part of the assignment
# Write a script that creates a binary search tree from an array of random numbers
# Confirms that the tree is balanced by calling #balanced?
# Prints out all of the elements in level, pre, post and in order
# Unbalance the tree by adding numbers > 100
# Confirm that the tree is unbalanced by calling #balanced?
# Balance the tree by calling #rebalance
# Confirm the tree is balanced by calling #balanced?
# Prints out all of the elements in level, pre, post and in order again

data_arr = Array.new(30) { rand(1..100) }

bst = Tree.new(data_arr)

p bst.balanced?
p bst.pretty_print

p bst.preorder
p bst.inorder
p bst.postorder

bst.insert(101)
bst.insert(114)
bst.insert(120)
bst.insert_iterative(250)
bst.insert_iterative(800)
p bst.pretty_print

p bst.balanced?
bst.rebalance

p bst.balanced?

p bst.preorder
p bst.inorder
p bst.postorder

p bst.pretty_print
