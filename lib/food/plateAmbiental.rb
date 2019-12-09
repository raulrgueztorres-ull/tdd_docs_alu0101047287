module Food

    class PlateAmbiental < Plate

        attr_reader :co2, :m2
        include Comparable

        def initialize(name, food, food_gr)
            super(name, food, food_gr)
            @co2 = daily_co2
            @m2 = ground_use_plate
        end

        def <=> (other)
            co2 <=> other.co2
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
        
        def index_VCT
            if VCT() < 670
                return 1
            elsif (670..830) === VCT()
                return 2
            else
                return 3
            end
        end

        def to_s
            s = super.to_s
            s << ", Impacto: GEI de #{co2} kgCO2eq y Uso del terreno de #{m2} metros cuadrados" 
        end
    end
end