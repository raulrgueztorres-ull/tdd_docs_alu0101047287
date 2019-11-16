module Food
	
	Node = Struct.new(:value, :next, :prev)
	class List
		attr_reader :head
		def initialize(value)
			@head = Node.new(value, nil, nil)
		end
	end
end
