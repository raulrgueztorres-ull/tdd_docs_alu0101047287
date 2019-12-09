module Food
    # Clase PlateAmbiental. Esta clase hereda de la clase Plate.
    class PlateAmbiental < Plate
        # Definicion de los atributos de lectura para co2 y m2 
        attr_reader :co2, :m2
        # Incluye Comparable
        include Comparable
        #Incluye Enumerable
        include Enumerable

        # Método para la creación de un plato ambiental.
        # @param name [String] Nombre del plato.
        # @param food [List] Lista de alimentos del plato.
        # @param food_gr [Array] Array de gramos de cada alimento del plato.
        # @return [PlateAmbiental] Objeto de clase PlateAmbiental.
        def initialize(name, food, food_gr)
            super(name, food, food_gr)
            @co2 = daily_co2
            @m2 = ground_use_plate
        end

        # Método para el correcto funcionamiento de Comparable
        # @param other [PlateAmbiental] Segundo plato a comparar.
        def <=> (other)
            co2 <=> other.co2
        end
        
        # Método para calcular las emisiones diarias de co2 de un plato
        # @return [Numeric] Valor de emisiones de co2 del plato.
        def daily_co2
            array = []
            food_gr.each { |val| array.push(val/100) }
            food.tail.value.list_amount_environmental_impact(food, array)
        end

        # Método para calcular el uso del terreno en m2 del plato.
        # @return [Numeric] Valor de uso del terreno del plato.
        def ground_use_plate
            array = [] 
            food_gr.each { |val| array.push(val/100) }
            food.tail.value.list_amount_ground_use(food, array)
        end
        
        # Método para calcular el índice del valor calórico del plato en función de un rango.
        # @return [Numeric] Índice del valor calórico total del plato.
        def index_VCT
            if VCT() < 670
                return 1
            elsif (670..830) === VCT()
                return 2
            else
                return 3
            end
        end

        # Método para calcular el índice de GEI del plato en función de un rango.
        # @return [Numeric] Índice del GEI del plato.
        def index_GEI
            if daily_co2 < 800
                return 1
            elsif (800..1200) === daily_co2
                return 2
            else
                return 3
            end
        end
        
        # Método para calcular el índice de la huella nutricional del plato.
        # @return [Numeric] Índice de la huella nutricional del plato.
        def huella_nutricional() 
            ((index_VCT + index_GEI)/2).round(1)
        end

        # Método para formatear un plato
        # @return [String] Cadena con la descripción del plato.
        def to_s
            s = super.to_s
            s << ", Impacto: GEI de #{co2} kgCO2eq y Uso del terreno de #{m2} metros cuadrados" 
        end
    end
end