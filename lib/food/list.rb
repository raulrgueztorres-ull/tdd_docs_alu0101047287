module Food
	
	Node = Struct.new(:value, :next, :prev)
	class List
		attr_reader :head, :tail
		def initialize(value)
			@head = Node.new(value, nil, nil)
			@tail = @head
		end
		
		def insert_head(value)
			current_head = @head
			new_head = Node.new(value, nil, current_head)
			current_head.next = new_head
			@head = new_head
		end
		
		def insert_tail(value)
			current_tail = @tail
			new_tail = Node.new(value, current_tail, nil)
			current_tail.prev = new_tail
			@tail = new_tail
		end
	end
end
