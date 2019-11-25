module Food
    class Plate
        attr_reader :name, :food, :food_gr
        include Comparable
        
        def initialize(name, food, food_gr)
            @name, @food, @food_gr = name, food, food_gr
        end

        def <=> (other)
            VCT() <=> other.VCT()
        end

        def VCT()
            kcals = 0
            i = 0
            food.each { |val|
                kcals += val.value.energetic_value_complex(val.value.proteins * (food_gr[i]/100), val.value.carbohydrates * (food_gr[i]/100), val.value.lipids * (food_gr[i]/100))
                i += 1
            }
            return kcals
        end

        def percentage_proteins()
            kcals = VCT()
            proteins = 0
            i = 0
            food.each { |val|
                proteins += val.value.kcal_proteins(val.value.proteins * (food_gr[i]/100))
                i += 1
            }
            return ((proteins * 100)/kcals).round(2)
        end

        def percentage_carbohydrates()
            kcals = VCT()
            carbohydrates = 0
            i = 0
            food.each { |val|
                carbohydrates += val.value.kcal_carbohydrates(val.value.carbohydrates * (food_gr[i]/100))
                i += 1
            }
            return ((carbohydrates * 100)/kcals).round(2)
        end

        def percentage_lipids()
            kcals = VCT()
            lipids = 0
            i = 0
            food.each { |val|
                lipids += val.value.kcal_lipids(val.value.lipids * (food_gr[i]/100))
                i += 1
            }
            return ((lipids * 100)/kcals).round(2)
        end

        def to_s
            format = "Nombre: #{name}, Alimentos:"
            i = 0
            food.each { |val| 
                if val == food.tail
                    format += " #{food_gr[i]} gr #{val.value.name}"
                else
                    format += ", #{food_gr[i]} gr #{val.value.name}"
                end
                i += 1
            }
            return format
        end
    end


end