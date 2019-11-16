module Food
	
	Node = Struct.new(:value, :next, :prev)
	class List
		attr_reader :head, :tail
		def initialize(value)
			@head = Node.new(value, nil, nil)
			@tail = @head
		end
		
		def insert_head(value)
		end
	end
end
