module Food
    class Plate
        attr_reader :name, :food, :food_gr
        def initialize(name, food, food_gr)
            @name, @food, @food_gr = name, food, food_gr
        end

        def kcals_plate()
            kcals = 0
            i = 0
            food.each { |val|
                kcals += val.value.energetic_value_complex(val.value.proteins * (food_gr[i]/100), val.value.carbohydrates * (food_gr[i]/100), val.value.lipids * (food_gr[i]/100))
                i += 1
            }
            return kcals
        end

        def percentage_proteins()
            kcals = kcals_plate
            proteins = 0
            i = 0
            food.each { |val|
                proteins += val.value.kcal_proteins(val.value.proteins * (food_gr[i]/100))
                i += 1
            }
            return ((proteins * 100)/kcals).round(2)
        end

        def percentage_carbohydrates()
            kcals = kcals_plate
            carbohydrates = 0
            i = 0
            food.each { |val|
                carbohydrates += val.value.kcal_carbohydrates(val.value.carbohydrates * (food_gr[i]/100))
                i += 1
            }
            return ((carbohydrates * 100)/kcals).round(2)
        end
    end


end