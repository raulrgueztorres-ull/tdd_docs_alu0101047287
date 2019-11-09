module Food
	class Food	
		attr_reader :name, :proteins, :carbohydrates, :lipids, :gei, :ground
	
		def initialize(name, proteins, carbohydrates, lipids, gei, ground)
	
			@name, @proteins, @carbohydrates, @lipids, @gei, @ground = name, proteins, carbohydrates, lipids, gei, ground
	
		end
		
		def to_s
		
		end

	end
end
