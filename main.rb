class Node
  attr_accessor :data, :r_child, :l_child

  def initialize(data=nil, r_child=nil, l_child=nil)
    @data = data
    @r_child = r_child
    @l_child = l_child
  end
end

class Tree
  attr_accessor :tree

  def initialize(array)
    @tree = build_tree(array)
  end

  def insert(value)
    value = [value]
    if @tree.data < value[0]
      current_node = @tree.r_child
      @tree.r_child = add(value, current_node)
    elsif root_node.data > value[0]
      current_node = @tree.l_child
      @tree.l_child = add(value, current_node)
    else
      array.shift
    end
    return @tree
  end

  def delete(value)
    value = [value]
    if @tree.data < value[0]
      current_node = @tree.r_child
      @tree.r_child = remove(value, current_node)
    elsif @tree.data > value[0]
      current_node = @tree.l_child
      @tree.l_child = remove(value, current_node)
    else
      @tree = recombine(@tree.l_child, @tree.r_child)
    end
    return @tree
  end

  def find(value)
    value = [value]
    if @tree.data < value[0]
      current_node = @tree.r_child
      return locate(value, current_node)
    elsif @tree.data > value[0]
      current_node = @tree.l_child
      return locate(value, current_node)
    end
    return @tree
  end

  private

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

  def remove(array, current_node)
    if current_node == nil
      return
    elsif current_node.data < array[0]
      current_node.r_child = remove(array, current_node.r_child)
      return current_node
    elsif current_node.data > array[0]
      current_node.l_child = remove(array, current_node.l_child)
      return current_node
    elsif current_node.data == array[0]
      current_node = recombine(current_node.l_child, current_node.r_child)
    end
  end

  def recombine(branch, current_node)
    if current_node == nil
      return branch
    else
      current_node.l_child = recombine(branch, current_node.l_child)
      return current_node
    end
  end

  def locate(array, current_node)
    if current_node == nil
      return
    elsif current_node.data < array[0]
      return locate(array, current_node.r_child)
    elsif current_node.data > array[0]
      return locate(array, current_node.l_child)
    elsif current_node.data == array[0]
      return current_node
    end
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

x = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324, 1])
x.insert(10000)
x.delete(8)
p x.find(4)
