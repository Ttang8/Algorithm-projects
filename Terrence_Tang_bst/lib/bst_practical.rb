
def kth_largest(tree_node, k)
  arr = in_order_traversal(tree_node)
  arr[arr.length - k]
end

def in_order_traversal(tree_node)
  return [tree_node] if tree_node.left == nil && tree_node.right == nil

  if tree_node.left
    left = in_order_traversal(tree_node.left)
  end
  if tree_node.right
    right = in_order_traversal(tree_node.right)
  end
  if left == nil
    left = []
  end
  if right == nil
    right = []
  end
  left + [tree_node] + right
end
