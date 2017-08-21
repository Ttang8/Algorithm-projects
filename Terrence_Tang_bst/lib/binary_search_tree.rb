require_relative 'bst_node'
# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value, tree_node = @root)
    if @root == nil
      @root = BSTNode.new(value)
      return value
    end
    if value <= tree_node.value
      if tree_node.left
        insert(value, tree_node.left)
      else
        tree_node.left = BSTNode.new(value, tree_node)
      end
    else
      if tree_node.right
        insert(value, tree_node.right)
      else
        tree_node.right = BSTNode.new(value, tree_node)
      end
    end
    value
  end

  def find(value, tree_node = @root)
    return tree_node if tree_node.value == value
    if value <= tree_node.value
      if tree_node.left
        find(value, tree_node.left)
      else
        return nil
      end
    else
      if tree_node.right
        find(value, tree_node.right)
      else
        return nil
      end
    end
  end

  def delete(value)
    if @root.value == value
      return @root = nil
    end
    child = find(value)
    if child.left
      max_node = maximum(child.left)
      if child.left == max_node
        if child.parent.left == child
          max_node.parent = child.parent
          child.parent.left = max_node
        elsif child.parent.right == child
          max_node.parent = child.parent
          child.parent.right = max_node
        end
      else
        if child.parent.left == child
          child.parent.left = max_node
        elsif child.parent.right == child
          child.parent.right = max_node
        end
        if max_node.left
          if max_node.parent.left == max_node
            max_node.parent.left = max_node.left
          elsif max_node.parent.right == max_node
            max_node.parent.right = max_node.left
          end
        end
        max_node.parent = child.parent
      end
    elsif child.right
      child.right.parent = child.parent
      if child.parent.left == child
        child.parent.left = child.right
      elsif child.parent.right == child
        child.parent.right = child.right
      end
    else
      if child.parent.left.value == value
        child.parent.left = nil
      else
        child.parent.right = nil
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    current_node = tree_node
    next_node = current_node.right
    until current_node.right == nil
      current_node = next_node
      next_node = current_node.right
    end
    current_node
  end

  def depth(tree_node = @root)
    depth = 0
    parent = [tree_node]
    children = []
    until parent.empty?
      parent.each do |node|
        if node.left
          children << node.left
        end
        if node.right
          children << node.right
        end
      end
      unless children.empty?
        depth += 1
      end
      parent = children
      children = []
    end
    depth
  end

  def is_balanced?(tree_node = @root)
    parent = [tree_node]
    children = []
    until parent.empty?
      parent.each do |node|
        left_depth = 0
        right_depth = 0
        if node.left
          left_depth = depth(node.left)
          children << node.left
        end
        if node.right
          right_depth = depth(node.right)
          children << node.right
        end
        difference = left_depth - right_depth
        return false unless [1,0,-1].include?(difference)
        parent = children
        children = []
      end
    end
    true
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [tree_node.value] if tree_node.left == nil && tree_node.right == nil

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
    left + [tree_node.value] + right
  end


  private
  # optional helper methods go here:

end
