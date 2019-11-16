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
		
		def insert(values)
			count = 0
			values.each do |val|
				insert_head(val)
				if @head.value.name == val.name
					count += 1
				else 
					raise "Se ha producido un error insertando el nodo"
				end
			end 
			return count
		end
	
		def extract_head()
			current_head = @head
			new_head = @head.prev
			new_head.next = nil
			current_head.prev = nil
			@head = new_head
			return current_head
		end

		def extract_tail()
		end
	end
end
