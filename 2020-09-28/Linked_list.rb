class Node
  attr_accessor :value, :child

  def initialize(value)
    @value = value
  end

  def to_s
    @value.to_s
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail, :size

  def initialize(value)
    @size = 1
    @tail = @head = Node.new(value)
  end

  def <<(value)
    tmp = Node.new(value)
    @tail = @tail.child = tmp
    @size += 1
  end

  def [](n)
    if n > size || n <= 0
      raise "Invalid size!"
    elsif n == size
      return @tail
    end
    count = 1
    tmp = @head
    while count < n
      tmp = tmp.child
      count += 1
    end
    tmp
  end

  def []=(n, value)
    node = self[n]
    node.value = value
  end

  def each(&block)
    tmp = self.head
    while tmp != nil
      yield tmp
      tmp = tmp.child
    end
  end
end

ll = LinkedList.new(3)

ll << 4
ll << 5

ll.each { |n| puts n }
puts
ll.each_slice(2) { |n| p n }
puts
puts ll.find_all { |n| n.value % 2 != 0}
puts
# puts ll[4]
puts ll[3]
puts ll[2]
puts ll[1]
# puts ll[0]
puts

ll[3]= 6
puts ll[3]
puts ll.include?(Node.new(6))
