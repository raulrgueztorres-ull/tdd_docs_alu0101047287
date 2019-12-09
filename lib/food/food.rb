module Food
	# Clase Food. Esta clase representa alimentos y sus propiedades.
	class Food
		# Incluye Comparable.
		include Comparable
		# Definición de los métodos de lectura para name, proteins, carbohydrates, lipids, gei y ground.
		attr_reader :name, :proteins, :carbohydrates, :lipids, :gei, :ground
	
		# Método para la creación de un alimento.
        # @param name [String] Nombre del alimento.
        # @param proteins [Numeric] Número de proteinas del alimento.
        # @param carbohydrates [Numeric] Número de carbohidratos del alimento.
		# @param lipids [Numeric] Número de lípidos del alimento.
		# @param gei [Numeric] Valor de las emisiones de efecto invernadero del alimento.
		# @param ground [Numeric] Valor de uso del terreno del alimento.
		# @return [Food] Objeto de la clase Food.
		def initialize(name, proteins, carbohydrates, lipids, gei, ground)
	
			@name, @proteins, @carbohydrates, @lipids, @gei, @ground = name, proteins, carbohydrates, lipids, gei, ground
	
		end
		
		# Método para el correcto funcionamiento de Comparable.
        # @param other [Food] Segundo alimento a comparar.
		def <=> (other)
			energetic_value_complex(proteins, carbohydrates, lipids) <=> other.energetic_value_complex(other.proteins, other.carbohydrates, other.lipids)
		end

		# Método para formatear un alimento.
        # @return [String] Cadena con la descripción del alimento.
		def to_s
                        "#{@name}: #{@proteins} g Proteins | #{@carbohydrates} g Carbohydrates | #{@lipids} g Lipids | #{@gei} kgCO2eq GEI | #{@ground} m2año Ground"	
		end
		
		# Método para calcular las kcals producidas por las proteinas.
		# @param proteins_g [Numeric] Gramos de proteinas del alimento.
		# @return [Numeric] Kcals producidas por las proteinas.
		def kcal_proteins(proteins_g)
			return (proteins_g * 4).round(1)
		end
	
		# Método para calcular las kcals producidas por los carbohidratos.
		# @param carbohydrates_g [Numeric] Gramos de carbohidratos del alimento.
		# @return [Numeric] Kcals producidas por los carbohidratos.
		def kcal_carbohydrates(carbohydrates_g)
			return (carbohydrates_g * 4).round(1)
		end
		
		# Método para calcular las kcals producidas por los lípidos.
		# @param lipids_g [Numeric] Gramos de lípidos del alimento.
		# @return [Numeric] Kcals producidas por los lípidos.
		def kcal_lipids(lipids_g)
			return (lipids_g * 9).round(1)
		end

		# Método para el cálculo simple del valor energético de un alimento.
		# @param proteins_kcal [Numeric] Número de kcals producidas por las proteinas.
		# @param carbohydrates_kcal [Numeric] Número de kcals producidas por los carbohidratos.
		# @param lipids_kcal [Numeric] Número de kcals producidas por los lípidos.
		# @return [Numeric] Valor energético del alimento.
		def energetic_value_simple(proteins_kcal, carbohydrates_kcal, lipids_kcal)
			return (proteins_kcal + carbohydrates_kcal + lipids_kcal).round(1)
		end
		
		# Método para el cálculo complejo del valor energético de un alimento.
		# @param proteins_g [Numeric] Gramos de proteinas del alimento.
		# @param carbohydrates_g [Numeric] Gramos de carbohidratos del alimento.
		# @param lipids_g [Numeric] Gramos de lípidos del alimento.
		# @return [Numeric] Valor energético del alimento.
		def energetic_value_complex(proteins_g, carbohydrates_g, lipids_g)
			return energetic_value_simple(kcal_proteins(proteins_g), kcal_carbohydrates(carbohydrates_g), kcal_lipids(lipids_g)).round(1)
		end
	
		# Método para el cálculo del impacto ambiental simple de un array de alimentos.
		# @param impact_values [Array] Array con los gei de los alimentos ya calculados en función de la cantidad.
		# @return impact_sum [Numeric] Impacto ambiental del conjunto de alimentos.
		def environmental_impact(impact_values)
			impact_sum = 0
			impact_values.each do |impact_val|
				impact_sum += impact_val
			end
			return impact_sum.round(2)
		end
	
		# Método para el cálculo del uso del terreno simple de un array de alimentos.
		# @param ground [Array] Array con los valores de uso del terreno de los alimentos ya calculados en función de la cantidad.
		# @return ground_use [Numeric] Uso del terreno del conjunto de alimentos.
		def ground_use(ground)
			ground_use_sum = 0
			ground.each do |ground_val|	
				ground_use_sum += ground_val
			end
			return ground_use_sum.round(2)	
		end

		# Método para el cálculo del impacto ambiental complejo de un array de alimentos.
		# @param food [Array] Array con los gei de los alimentos.
		# @param amount [Array] Array con la cantidad de cada alimento.
		# @return [impact_sum, ground_sum] [Array] Array con el impacto ambiental y el uso del terreno del conjunto de alimentos.
		def environmental_impact_complex(food, amount)
			impact_sum = 0
			ground_sum = 0
			if food.length == amount.length
				for i in (0..food.length - 1) do 
					impact_sum += ((food[i].gei).to_f * amount[i].to_f)
					ground_sum += ((food[i].ground).to_f * amount[i].to_f)
				end
			else
				raise 'Se ha producido un error. El tamaño del array de alimentos es distinto al tamaño del array de cantidades'
			end
			return [impact_sum.round(2), ground_sum.round(2)] 
		end
		
		# Método para el cálculo del impacto ambiental simple de una lista de alimentos.
		# @param values [List] Lista con los alimentos.
		# @return impact_sum [Numeric] Impacto ambiental del conjunto de alimentos.
		def list_environmental_impact(values)
			impact_sum = 0
			current_node = values.head
			while current_node != values.tail	
				impact_sum += (current_node.value.gei).to_f
				current_node = current_node.prev
			end
			if current_node == values.tail
				impact_sum += (current_node.value.gei).to_f
			end
			return impact_sum.round(2)
		end
		
		# Método para el cálculo del impacto ambiental complejo de una lista de alimentos con cantidades.
		# @param values [List] Lista con los alimentos.
		# @param amount [Array] Array con las cantidades de cada alimento.
		# @return impact_sum [Numeric] Impacto ambiental del conjunto de alimentos.
		def list_amount_environmental_impact(values, amount)
			impact_sum = 0
			current_node = values.tail
			i = 0
			if values.length == amount.length
				while current_node != values.head
					impact_sum += (current_node.value.gei * amount[i]).to_f
					current_node = current_node.next
					i += 1
				end
				if current_node == values.head
					impact_sum += (current_node.value.gei * amount[i]).to_f
				end
			else
				raise "Error. Los alimentos pasados y sus cantidades no son iguales."
			end
			return impact_sum.round(2)
		end

		# Método para el cálculo del impacto ambiental simple de una lista de alimentos en un año.
		# @param values [List] Lista con los alimentos.
		# @return impact_sum [Numeric] Impacto ambiental del conjunto de alimentos.
		def list_environmental_impact_annual(values)
			impact_sum = 0
			current_node = values.head
			while current_node != values.tail	
				impact_sum += (current_node.value.gei).to_f
				current_node = current_node.prev
			end
			if current_node == values.tail
				impact_sum += (current_node.value.gei).to_f
			end
			return (impact_sum * 365).round(2)
		end

		# Método para el cálculo del impacto ambiental complejo de una lista de alimentos con cantidades en un año.
		# @param values [List] Lista con los alimentos.
		# @param amount [Array] Array con las cantidades de los alimentos.
		# @return impact_sum [Numeric] Impacto ambiental del conjunto de alimentos.
		def list_amount_environmental_impact_annual(values, amount)
			impact_sum = 0
			current_node = values.tail
			i = 0
			if values.length == amount.length
				while current_node != values.head
					impact_sum += (current_node.value.gei * amount[i]).to_f
					current_node = current_node.next
					i += 1
				end
				if current_node == values.head
					impact_sum += (current_node.value.gei * amount[i]).to_f
				end
			else
				raise "Error. Los alimentos pasados y sus cantidades no son iguales."
			end
			return (impact_sum * 365).round(2)
		end

		# Método para el cálculo del uso del terreno simple de una lista de alimentos.
		# @param values [List] Lista con los alimentos.
		# @return ground_sum [Numeric] Uso del terreno del conjunto de alimentos.
		def list_ground_use(values)
			ground_sum = 0
			current_node = values.head
			while current_node != values.tail
				ground_sum += (current_node.value.ground).to_f
				current_node = current_node.prev
			end
			if current_node == values.tail
				ground_sum += (current_node.value.ground).to_f
			end
			return ground_sum.round(2)
		end

		# Método para el cálculo del uso del terreno complejo de una lista de alimentos con cantidades.
		# @param values [List] Lista con los alimentos.
		# @param amount [Array] Array con las cantidades de los alimentos.
		# @return ground_sum [Numeric] Uso del terreno del conjunto de alimentos.
		def list_amount_ground_use(values, amount)
			ground_sum = 0
			current_node = values.tail
			i = 0
			if values.length == amount.length
				while current_node != values.head
					ground_sum += (current_node.value.ground * amount[i]).to_f
					current_node = current_node.next
					i += 1
				end
				if current_node == values.head
					ground_sum += (current_node.value.ground * amount[i]).to_f
				end
			else
				raise "Erorr. Los alimentos pasados y sus cantidades no son iguales."
			end
			return ground_sum.round(2)
		end

		# Método para el cálculo del uso del terreno complejo de una lista de alimentos en un año.
		# @param values [List] Lista con los alimentos.
		# @param amount [Array] Array con las cantidades de los alimentos.
		# @return ground_sum [Numeric] Uso del terreno del conjunto de alimentos.
		def list_amount_ground_use_annual(values, amount)
			ground_sum = 0
			current_node = values.tail
			i = 0
			if values.length == amount.length
				while current_node != values.head
					ground_sum += (current_node.value.ground * amount[i]).to_f
					current_node = current_node.next
					i += 1
				end
				if current_node == values.head
					ground_sum += (current_node.value.ground * amount[i]).to_f
				end
			else
				raise "Erorr. Los alimentos pasados y sus cantidades no son iguales."
			end
			return (ground_sum * 365).round(2)
		end

		# Método para el cálculo del uso del terreno simple de una lista de alimentos en un año.
		# @param values [List] Lista con los alimentos.
		# @return ground_sum [Numeric] Uso del terreno del conjunto de alimentos.
		def list_ground_use_annual(values)
			ground_sum = 0
			current_node = values.head
			while current_node != values.tail
				ground_sum += (current_node.value.ground).to_f
				current_node = current_node.prev
			end
			if current_node == values.tail
				ground_sum += (current_node.value.ground).to_f
			end
			return (ground_sum * 365).round(2)
		end
	end
end