module Food
	class Food	
		attr_reader :name, :proteins, :carbohydrates, :lipids, :gei, :ground
	
		def initialize(name, proteins, carbohydrates, lipids, gei, ground)
	
			@name, @proteins, @carbohydrates, @lipids, @gei, @ground = name, proteins, carbohydrates, lipids, gei, ground
	
		end
		
		def to_s
                        "#{@name}: #{@proteins} g Proteins | #{@carbohydrates} g Carbohydrates | #{@lipids} g Lipids | #{@gei} kgCO2eq GEI | #{@ground} m2año Ground"	
		end

	end
end
