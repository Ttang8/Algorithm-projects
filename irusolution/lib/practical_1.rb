# Given a doubly linked list, like the one you built, reverse it.
# You can assume that this method is monkey patching the LinkedList class
# that you built, so any methods and instance variables in that class
# are available to you.

class LinkedList
  # ....

  def reverse
    @head
    @tail

    @tail.next = @head.next
    @head.prev = @tail.prev
    @tail.prev.next = @head
    @head.next.prev = @tail

    h n1 n2 t
    t n1 n2 h
    h n2 n1 t

    linked_list.each do |link|

    original_first =  first
    pointer = @head
    until original_first == last
      new_last = last.prev
      new_first = last

      pointer.next = new_first
      new_first.prev = pointer

      @tail.prev = new_last
      new_last.next = @tail
      pointer = new_first
    end

    pointer.next = last
    last.prev = pointer
  end
end
