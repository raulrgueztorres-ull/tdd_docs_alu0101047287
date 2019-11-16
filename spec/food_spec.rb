require 'food'

RSpec.describe Food do
	
	before :all do
		@carne_vaca = Food::Food.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
		@carne_cordero = Food::Food.new("Carne de Cordero", 18.0, 0.0, 17.0, 20.0, 185.0)
		@camarones = Food::Food.new("Camarones", 17.6, 1.5, 0.6, 18.0, 2.0)
		@chocolate = Food::Food.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
		@salmon = Food::Food.new("Salmón", 19.9, 0.0, 13.6, 6.0, 3.7)
		@cerdo = Food::Food.new("Cerdo", 21.5, 0.0, 6.3, 7.6, 11.0)
		@pollo = Food::Food.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)
		@queso = Food::Food.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0)
		@cerveza = Food::Food.new("Cerveza", 0.5, 3.6, 0.0, 0.24, 0.22)
		@leche_vaca = Food::Food.new("Leche de Vaca", 3.3, 4.8, 3.2, 3.2, 8.9)
		@huevos = Food::Food.new("Huevos", 13.0, 1.1, 11.0, 4.2, 5.7)
		@cafe = Food::Food.new("Café", 0.1, 0.0, 0.0, 0.4, 0.3)
		@tofu = Food::Food.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
		@lentejas = Food::Food.new("Lentejas", 23.5, 52.0, 1.4, 0.4, 3.4)
		@nuez = Food::Food.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)

		@menu  = Food::Food.new("Menú", 0.0, 0.0, 0.0, 0.0, 0.0)
	
		@hombre = [@chocolate.gei * 2, @queso.gei * 0.5, @nuez.gei * 1.5, @lentejas.gei]
		@mujer = [@chocolate.gei, @nuez.gei * 0.5, @carne_vaca.gei, @lentejas.gei, @queso.gei];

		@hombre_54 = [@carne_vaca.gei, @lentejas.gei, @leche_vaca.gei, @chocolate.gei, @cerveza.gei, @cafe.gei * 3]
		@mujer_41 = [@carne_vaca.gei, @tofu.gei, @chocolate.gei, @leche_vaca.gei * 2]

		@hombre_terreno = [ @carne_vaca.ground, @lentejas.ground, @leche_vaca.ground, @chocolate.ground, @cerveza.ground, @cafe.ground * 3]
		@mujer_terreno = [ @carne_vaca.ground, @tofu.ground, @chocolate.ground, @leche_vaca.ground * 2]

		@hombre_complejo = [@chocolate, @queso, @nuez, @lentejas]
		@mujer_complejo = [@chocolate, @nuez, @carne_vaca, @lentejas, @queso]
		@hombre_cantidad = [2, 0.5, 1.5, 1]
		@mujer_cantidad = [1, 0.5, 1, 1, 1]

		@hombre_54_complejo = [@carne_vaca, @lentejas, @leche_vaca, @chocolate, @cerveza, @cafe]
		@mujer_41_complejo = [@carne_vaca, @tofu, @chocolate, @leche_vaca]
		@hombre_54_cantidad = [1, 1, 1, 1, 1, 3]
		@mujer_41_cantidad = [1, 1, 1, 2]
		
		@node_carne_vaca = Food::Node.new(@carne_vaca, nil, nil)
		@list = Food::List.new(@carne_vaca)		
	end

	context "# Nombre del Alimento" do

		it "# Existe un método para obtener el nombre del alimento" do
			expect(@carne_vaca).to respond_to(:name)
		end

		it "# Se almacena correctamente el nombre de un alimento" do
			expect(@carne_vaca.name).to eq("Carne de Vaca")
		end
	end

	context "# Atributo Proteins" do 
		
		it "# Existe el atributo proteins" do
			expect(@carne_vaca).to respond_to(:proteins)
		end

		it "# Se almacena correctamente el valor de las proteinas" do
			expect(@carne_vaca.proteins).to eq(21.1)
		end
	end

	context "# Atributo Carbohydrates" do
	
		it "# Existe el atributo carbohydrates" do
			expect(@carne_vaca).to respond_to(:carbohydrates)
		end
		
		it "# Se almacena correctamente el valor de las proteinas" do
			expect(@carne_vaca.carbohydrates).to eq(0.0)
		end

	end

	context "# Atributo Lipids" do

                it "# Existe el atributo lipids" do
                        expect(@carne_vaca).to respond_to(:lipids)
                end

                it "# Se almacena correctamente el valor de los lipidos" do
                        expect(@carne_vaca.lipids).to eq(3.1)
                end

        end

	context "# Atributo GEI" do

                it "# Existe el atributo gei" do
                        expect(@carne_vaca).to respond_to(:gei)
                end

                it "# Se almacena correctamente el valor de GEI" do
                        expect(@carne_vaca.gei).to eq(50.0)
                end

        end

	context "# Atributo Ground" do

                it "# Existe el atributo ground" do
                        expect(@carne_vaca).to respond_to(:ground)
                end

                it "# Se almacena correctamente el valor de ground" do
                        expect(@carne_vaca.ground).to eq(164.0)
                end

        end

	context "# Alimento Formateado" do
		
		it "# Existe un método para formatear el alimento" do
			expect(@carne_vaca).to respond_to(:to_s)
		end

		it "# Se formatea correctamente el alimento" do
			expect(@carne_vaca.to_s).to eq("#{@carne_vaca.name}: #{@carne_vaca.proteins} g Proteins | #{@carne_vaca.carbohydrates} g Carbohydrates | #{@carne_vaca.lipids} g Lipids | #{@carne_vaca.gei} kgCO2eq GEI | #{@carne_vaca.ground} m2año Ground")
		end
	end

	context "# Kcal generadas por los macronutrientes" do
		
		it "# Cálculo correcto de las kcal de las proteinas" do
			expect(@carne_vaca.kcal_proteins(@carne_vaca.proteins)).to eq(84.4)
		end

		it "# Cálculo correcto de las kcal de los glúcidos" do
			expect(@carne_vaca.kcal_carbohydrates(@carne_vaca.carbohydrates)).to eq(0)
		end

		it "# Cálculo correcto de las kcal de los lípidos" do
			expect(@carne_vaca.kcal_lipids(@carne_vaca.lipids)).to eq(27.9)
		end
	end

	context "# Valor energético de un alimento" do
		
		it "# Cálculo correcto del valor energético de un alimento. Método complejo" do
			expect(@carne_vaca.energetic_value_complex(@carne_vaca.proteins, @carne_vaca.carbohydrates, @carne_vaca.lipids)).to eq(112.3)
		end

		it "# Cálculo correcto del valor energético de un alimento. Método simple" do 
			expect(@carne_vaca.energetic_value_simple(@carne_vaca.kcal_proteins(@carne_vaca.proteins), @carne_vaca.kcal_carbohydrates(@carne_vaca.carbohydrates), @carne_vaca.kcal_lipids(@carne_vaca.lipids))).to eq(112.3)
		end
	end
		
	context "# Cálculo del impacto ambiental" do
		it "# Se calcula correctamente el impacto ambiental de un hombre" do
			expect(@menu.environmental_impact(@hombre)).to eq(10.95)
		end
	
		it "# Se calcula correctamente el impacto ambiental de una mujer" do
			expect(@menu.environmental_impact(@mujer)).to eq(63.85)
		end

		it "# Se calcula correctamente el impacto ambiental de un hombre con proteinas 54 gramos" do
			expect(@menu.environmental_impact(@hombre_54)).to eq(57.34)
		end
		
		it "# Se calcula correctamente el impacto ambiental de una mujer con proteinas 41 gramos" do
			expect(@menu.environmental_impact(@mujer_41)).to eq(60.70)
		end
		
		it "# Se calcula correctamente el impacto ambiental complejo de un hombre" do
			expect(@menu.environmental_impact_complex(@hombre_complejo, @hombre_cantidad)).to eq([10.95, 42.55])
		end
		
		it "# Se calcula correctamente el impacto ambiental complejo de una mujer" do
			expect(@menu.environmental_impact_complex(@mujer_complejo, @mujer_cantidad)).to eq([63.85, 215.75])
		end
	
		it "# Se calcula correctamente el impacto ambiental complejo de un hombre con proteinas 54 gramos" do
			expect(@menu.environmental_impact_complex(@hombre_54_complejo, @hombre_54_cantidad)).to eq([57.34, 180.82])
		end
		
		it "# Se calcula correctamente el impacto ambiental complejo de una mujer con proteinas 41 gramos" do
			expect(@menu.environmental_impact_complex(@mujer_41_complejo, @mujer_41_cantidad)).to eq([60.70, 187.4])
		end
	
		it "# Se calcula correctamente el uso del terreno del menú de un hombre" do
			expect(@menu.ground_use(@hombre_terreno)).to eq(180.82)
		end
	
		it "# Se calcula correctamente el uso del terreno del menú de una mujer" do
			expect(@menu.ground_use(@mujer_terreno)).to eq(187.4)
		end
	end

	context "# Valor de Nodo" do 
		it "# Se creó correctamente el nodo con el valor" do
			expect(@node_carne_vaca.value.name).to eq("Carne de Vaca")
		end
		
		it "# Se creó correctamente el nodo con el valor next" do
			expect(@node_carne_vaca.next).to eq(nil)
		end
		
		it "# Se creó correctamente el nodo con el valor prev" do
			expect(@node_carne_vaca.prev).to eq(nil)
		end	
	end

	context "# Lista" do
		it "# Se crea correctamente el head de la lista" do
			expect(@list).to respond_to(:head)
		end
	
		it "# Se crea correctamente el elemento tail de la lista" do
			expect(@list).to respond_to(:tail)
		end
	end
end
