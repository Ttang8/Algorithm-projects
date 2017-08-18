## Problem
This is a two part problem:
1. First, write a series of instructions on how to build out an LRU Cache (pretend
the person you're writing to has no idea how to build one. Don't forget to address
the reasoning behind using particular data structures).
2. Implement an LRU Cache from scratch with no outside references. **Don't look
at the code or instructions from your homework!**

## Solution

### Part 1
Write first part here:
1. create a hashmap where the key is the input that you want to put in and the value is a node that is part of a linked list.  there is a count that keeps track of the count of the map.  if the count exceeds the max the first node that was put in gets removed before appending the new node. before a key is appended, check the hashmap if key exists. if it does, return value and update linked list to update the position of the node in the linked list to append
2.

### Part 2
```ruby
class LRUCache

  def initialize(max, prc)
    @map = Hashmap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @store.length
  end

  def get(key)
    if count == 0 || @map.include?(key)

    end
  end

  def calc(key)
    @prc.call(key)
  end
end
```
