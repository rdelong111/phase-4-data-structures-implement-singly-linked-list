require_relative './node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def prepend(node)
    if @head.nil?
      @head = node
      return
    else
      current_head = node
      current_head.next_node = @head
      @head = current_head
    end
  end

  def append(node)
    if @head.nil?
      @head = node
      return
    end

    last_node = @head
    while last_node.next_node
      last_node = last_node.next_node
    end

    last_node.next_node = node
  end

  def delete_head
    if @head.nil?
      return
    end

    current_head = @head
    new_head = @head.next_node
    @head.next_node = nil
    @head = new_head
  end

  def delete_tail
    if @head.nil?
      return
    end

    if @head.next_node.nil?
      return @head = nil
    end

    current_node = @head
    while current_node.next_node.next_node
      current_node = current_node.next_node
    end
    current_node.next_node = nil
  end

  def add_after(index, node)
    current_node = @head
    current_head = current_node
    (index).times do |t|
      current_node = current_node.next_node
      if current_node.next_node.nil?
        current_node.next_node = node
        return @head = current_head
      end
    end
    
    node.next_node = current_node.next_node
    current_node.next_node = node
    @head = current_head
  end

  def search(value)
    current_node = @head
    while current_node
      return current_node if current_node.data == value
      current_node = current_node.next_node
    end
  end
end
