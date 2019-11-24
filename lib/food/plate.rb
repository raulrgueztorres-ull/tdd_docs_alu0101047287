module Food
    class Plate
        attr_reader :name, :food, :food_gr
        def initialize(name, food, food_gr)
            @name, @food, @food_gr = name, food, food_gr
        end
    end


end