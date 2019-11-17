module Food
	class Food
		attr_reader :name, :proteins, :carbohydrates, :lipids, :gei, :ground
	
		def initialize(name, proteins, carbohydrates, lipids, gei, ground)
	
			@name, @proteins, @carbohydrates, @lipids, @gei, @ground = name, proteins, carbohydrates, lipids, gei, ground
	
		end
		
		def to_s
                        "#{@name}: #{@proteins} g Proteins | #{@carbohydrates} g Carbohydrates | #{@lipids} g Lipids | #{@gei} kgCO2eq GEI | #{@ground} m2año Ground"	
		end
		
		def kcal_proteins(proteins_g)
			return (proteins_g * 4).round(1)
		end
	
		def kcal_carbohydrates(carbohydrates_g)
			return (carbohydrates_g * 4).round(1)
		end
		
		def kcal_lipids(lipids_g)
			return (lipids_g * 9).round(1)
		end

		def energetic_value_simple(proteins_kcal, carbohydrates_kcal, lipids_kcal)
			return (proteins_kcal + carbohydrates_kcal + lipids_kcal).round(1)
		end
		
		def energetic_value_complex(proteins_g, carbohydrates_g, lipids_g)
			return energetic_value_simple(kcal_proteins(proteins_g), kcal_carbohydrates(carbohydrates_g), kcal_lipids(lipids_g)).round(1)
		end
	
		def environmental_impact(impact_values)
			impact_sum = 0
			impact_values.each do |impact_val|
				impact_sum += impact_val
			end
			return impact_sum.round(2)
		end
	
		def ground_use(ground)
			ground_use_sum = 0
			ground.each do |ground_val|	
				ground_use_sum += ground_val
			end
			return ground_use_sum.round(2)	
		end

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
