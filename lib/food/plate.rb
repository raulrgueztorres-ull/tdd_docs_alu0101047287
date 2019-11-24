module Food
    class Plate
        attr_reader :name, :food
        def initialize(name, food, food_gr)
            @name, @food, @food_gr = name, food, food_gr
        end
    end


end