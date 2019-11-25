module Food

    class PlateAmbiental < Plate

        attr_reader :co2, :m2
        def initialize(name, food, food_gr)
            super(name, food, food_gr)
            @co2 = daily_co2
            @m2 = ground_use_plate
        end

        def daily_co2
            array = []
            food_gr.each { |val| array.push(val/100) }
            food.tail.value.list_amount_environmental_impact(food, array)
        end

        def ground_use_plate
            array = [] 
            food_gr.each { |val| array.push(val/100) }
            food.tail.value.list_amount_ground_use(food, array)
        end
    end
end