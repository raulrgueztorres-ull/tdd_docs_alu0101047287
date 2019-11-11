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
	end
end
