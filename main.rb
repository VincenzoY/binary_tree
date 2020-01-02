class Node
  attr_accessor :data, :r_child, :l_child

  def initialize(data=nil, r_child=nil, l_child=nil)
    @data = data
    @r_child = r_child
    @l_child = l_child
  end
end

def build_tree(array)
  root_node = Node.new(array.shift)
  until array.empty?
    if root_node.data < array[0]
      current_node = root_node.r_child
      root_node.r_child = add(array, current_node)
    elsif root_node.data > array[0]
      current_node = root_node.l_child
      root_node.l_child = add(array, current_node)
    else
      array.shift
    end
  end
  return root_node
end

def add(array, current_node)
  if current_node == nil
    return Node.new(array.shift)
  elsif current_node.data < array[0]
    current_node.r_child = add(array, current_node.r_child)
    return current_node
  elsif current_node.data > array[0]
    current_node.l_child = add(array, current_node.l_child)
    return current_node
  elsif current_node.data == array[0]
    array.shift
    return current_node
  end
end

build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324, 1])

