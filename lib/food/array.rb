class Array 
    # Método para calcular el máximo elemento de un array de platos
    # @return [PlateAmbiental] el plato del array con mayor huella nutricional
    def maxo  
        self.max { |a, b| a.huella_nutricional <=> b.huella_nutricional }
    end

    # Método para incrementar el precio de los platos de un array
    # @param plates [PlateAmbiental] array con los platos
    # @return new_array [Array] array con los precios incrementados
    def incremento_precio(plates)
        max_huella = plates.maxo.huella_nutricional
        new_array = []
        self.each { |val| 
            if max_huella == 3
                new_array.push(val * 1.50)
            elsif max_huella == 2 
                new_array.push(val * 1.25)
            else
                new_array.push(val * 1.10)
            end
        }
        return new_array
    end 
end
