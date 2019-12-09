module Food	
	# Creación de la estructura de un Nodo.
	# @param value Objeto a almacenar.
	# @param next Referencia del siguiente nodo.
	# @param prev Referencia del nodo previo.
	Node = Struct.new(:value, :next, :prev)

	# Clase List. Esta clase representa el funcionamiento de una lista doblemente enlazada.
	class List
		# Incluye Enumerable.
		include Enumerable
		# Definición de los métodos de lectura para head y tail.
		attr_reader :head, :tail

		# Método para la creación de una lista.
		# @param value Objeto a almacenar.
		# @return Objeto de clase List.
		def initialize(value)
			@head = Node.new(value, nil, nil)
			@tail = @head
		end
		
		# Método para insertar un nodo por la cabeza de la lista.
		# @param value Objeto a insertar.
		# @return head [Node] Nodo de la cabeza de la lista.
		def insert_head(value)
			current_head = @head
			new_head = Node.new(value, nil, current_head)
			current_head.next = new_head
			@head = new_head
		end
		
		# Método para insertar un nodo por la cola de la lista.
		# @param value Objeto a insertar.
		# @return tail [Node] Nodo de la cola de la lista.
		def insert_tail(value)
			current_tail = @tail
			new_tail = Node.new(value, current_tail, nil)
			current_tail.prev = new_tail
			@tail = new_tail
		end
		
		# Método para insertar un conjunto de nodos en la lista por la cabeza.
		# @param value [Array] Array de objectos a insertar.
		# @return count [Numeric] Número de nodos insertados en la lista durante el método.
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
	
		# Método para extraer un nodo por la cabeza de la lista.
		# @return current_head [Node] Nodo extraido de la cabeza de la lista.
		def extract_head()
			current_head = @head
			new_head = @head.prev
			new_head.next = nil
			current_head.prev = nil
			@head = new_head
			return current_head
		end

		# Método para extraer un nodo por la cola de la lista.
		# @return current_tail [Node] Nodo extraido de la cola de la lista.
		def extract_tail()
			current_tail = @tail
			new_tail = @tail.next
			new_tail.prev = nil
			current_tail.next = nil
			@tail = new_tail
			return current_tail
		end
	
		# Método para calcular la longitud de la lista.
		# @return length [Numeric] Número de elementos de la lista.
		def length
			current_node = self.head
			length = 1
			while current_node.prev != nil
				length += 1
				current_node = current_node.prev
			end
			return length
		end

		# Método para recorrer la lista. Necesario además para el Enumerable.
		def each 
			return nil unless block_given?
			current = self.tail
			while current
				yield current
				current = current.next
			end
		end
	end
end