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
	end
end
