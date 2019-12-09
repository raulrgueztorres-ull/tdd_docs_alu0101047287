class Array 
    def maxo
        self.max { |a, b| a.huella_nutricional <=> b.huella_nutricional }
    end
    
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
