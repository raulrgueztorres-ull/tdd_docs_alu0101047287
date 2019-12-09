class Array 
    def maxo
        self.max { |a, b| a.huella_nutricional <=> b.huella_nutricional }
    end
end
