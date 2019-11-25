module Food

    class PlateAmbiental < Plate

        attr_reader :co2, :m2
        def initialize(name, food, food_gr, co2 = 0, m2 = 0)
            super(name, food, food_gr)
        end
    end
end