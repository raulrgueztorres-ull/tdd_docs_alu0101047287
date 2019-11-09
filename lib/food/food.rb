module Food
	class Food	
		attr_reader :name, :proteins, :carbohydrates
	
		def initialize(name, proteins, carbohydrates, lipids, gei, ground)
	
			@name, @proteins, @carbohydrates, @lipids, @gei, @ground = name, proteins, carbohydrates, lipids, gei, ground
	
		end

	end
end
