module Food
    # Clase Plate. Esta clase se emplea para definir un plato, es decir, un conjunto de alimentos.
    class Plate
        # Definición de los atributos de lectura para name, food y food_gr.
        attr_reader :name, :food, :food_gr
        #Incluye Comparable.
        include Comparable
        
        # Método para la creación de un plato.
        # @param name [String] Nombre del plato.
        # @param food [List] Lista de alimentos del plato.
        # @param food_gr [Array] Array de gramos de cada alimento del plato.
        # @return [Plate] Objeto de clase Plate.
        def initialize(name, food, food_gr)
            @name, @food, @food_gr = name, food, food_gr
        end

        # Método para el correcto funcionamiento de Comparable.
        # @param other [Plate] Segundo plato a comparar.
        def <=> (other)
            VCT() <=> other.VCT()
        end

        # Método para calcular el valor calórico total de un plato.
        # @return [Numeric] Valor calórico total del plato.
        def VCT()
            kcals = 0
            i = 0
            food.each { |val|
                kcals += val.value.energetic_value_complex(val.value.proteins * (food_gr[i]/100), val.value.carbohydrates * (food_gr[i]/100), val.value.lipids * (food_gr[i]/100))
                i += 1
            }
            return kcals
        end

        # Método para calcular el porcentaje de proteinas del plato.
        # @return [Numeric] Porcentaje de proteinas del plato.
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

        # Método para calcular el porcentaje de carbohidratos del plato.
        # @return [Numeric] Porcentaje de carbohidratos del plato.
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

        # Método para calcular el porcentaje de lípidos del plato.
        # @return [Numeric] Porcentaje de lípidos del plato.
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

        # Método para formatear un plato.
        # @return [String] Cadena con la descripción del plato.
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