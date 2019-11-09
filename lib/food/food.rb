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
			return proteins_g * 4
		end
	
		def kcal_carbohydrates(carbohydrates_g)
			return carbohydrates_g * 4
		end

	end
end
