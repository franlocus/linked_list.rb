
class LinkedList
    attr_reader :head, :tail

    def append(value)
        unless @tail.nil?
            prev_tail = @tail
            @tail = Node.new(value)
            prev_tail.next_node = @tail
            return @tail
        end
       
        @tail = Node.new(value)
        @head ||= @tail
    end

    def prepend(value)
        @head = Node.new(value, @head)
        @tail ||= @head
    end

    def size
        counter = 0
        current_node = @head
        until current_node.nil?
            counter += 1
            current_node = current_node.next_node
        end
        counter
    end

    def at(index)
        raise "There is nothing at that index." if index > size - 1

        current_node = @head
        index.times do
            break if current_node.nil?

            current_node = current_node.next_node
        end
        current_node
    end

    def pop
        return "The list is empty. Nothing removed" if size.zero?
        return @tail = @head = nil if size == 1

        @tail = at(size - 2)
        @tail.next_node = nil
    end

    def contains?(value)
        !!find(value)
    end

    def find(value)
        counter = 0
        current_node = @head
        until current_node.nil? 
            return counter if current_node.value == value

            counter += 1
            current_node = current_node.next_node
        end
        nil
    end

    def to_s
        return "The list is empty." if size.zero?

        current_node = @head
        until current_node.nil?
            print "(#{current_node.value}) -> "
            current_node = current_node.next_node
        end
        print "nil"
    end

    def insert_at(value, index)
        return prepend(value) if index.zero?
        return append(value) if at(index) == @tail

        at(index - 1).next_node = Node.new(value, at(index - 1).next_node)
    end

    def remove_at(index)
        return @head = @head.next_node if index.zero?
        return pop if at(index) == @tail
        
        at(index - 1).next_node = at(index + 1)
    end

end

class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
    end

end

