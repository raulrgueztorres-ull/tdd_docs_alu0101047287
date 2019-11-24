module Food
    class Plate
        attr_reader :name
        def initialize(name, food, food_gr)
            @name, @food, @food_gr = name, food, food_gr
        end
    end


end