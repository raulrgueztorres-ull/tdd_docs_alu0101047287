module Food
	
	Node = Struct.new(:value, :next, :prev)
	class List
		attr_reader :head, :tail
		def initialize(value)
			@head = Node.new(value, nil, nil)
			@tail = @head
		end
	end
end
