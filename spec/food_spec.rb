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
		
		@española = Food::List.new(@lentejas)
		@española.insert([@lentejas, @camarones, @chocolate, @leche_vaca, @nuez, @carne_cordero])
		
		@vasca = Food::List.new(@chocolate)
                @vasca.insert([@leche_vaca, @leche_vaca, @tofu, @lentejas, @lentejas])

                @vegetaria = Food::List.new(@lentejas)
                @vegetaria.insert([@lentejas, @lentejas, @leche_vaca, @leche_vaca, @huevos, @queso, @queso])

                @vegetaliana = Food::List.new(@lentejas)
                @vegetaliana.insert([@lentejas, @lentejas, @tofu, @nuez])

                @locura_carne = Food::List.new(@carne_vaca)
                @locura_carne.insert([@pollo, @cerdo, @cerdo, @huevos, @leche_vaca, @lentejas])		

		@española_complex = Food::List.new(@lentejas)
		@española_complex.insert([@camarones, @chocolate, @leche_vaca, @nuez, @carne_cordero])	
		@cantidad_española = [2, 1, 1, 1, 1, 1]

		@vasca_complex = Food::List.new(@chocolate)
                @vasca_complex.insert([@leche_vaca, @tofu, @lentejas])
                @cantidad_vasca = [1, 2, 1, 2]

                @vegetaria_complex = Food::List.new(@lentejas)
                @vegetaria_complex.insert([@leche_vaca, @huevos, @queso])
                @cantidad_vegetaria = [3, 2, 1, 1.5]

                @vegetaliana_complex = Food::List.new(@lentejas)
                @vegetaliana_complex.insert([@tofu, @nuez])
                @cantidad_vegetaliana = [3, 1, 1]

                @locura_carne_complex = Food::List.new(@carne_vaca)
                @locura_carne_complex.insert([@pollo, @cerdo, @huevos, @leche_vaca, @lentejas])
				@cantidad_locura_carne = [1, 1, 2, 1, 1, 1]
				
		@cantidadGR_española = [200, 100, 100, 100, 100, 100]
		@plate = Food::Plate.new("Prueba", @española_complex, @cantidadGR_española)

		@plate_ambiental = Food::PlateAmbiental.new("Prueba", @española_complex, @cantidadGR_española)
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
		it "# Existe un método para obtener el head de la lista" do
			expect(@list).to respond_to(:head)
		end
	
		it "# Existe un método para obtener el tail de la lista" do
			expect(@list).to respond_to(:tail)
		end

		it "# Se introdujo correctamente el elemento head en la lista" do
			expect(@list.head.value.name).to eq("Carne de Vaca")	
		end

		it "# Se introdujo correctamente el elemento tail en la lista" do
			expect(@list.tail.value.name).to eq("Carne de Vaca")
		end
	end
	
	context "# Insertar en la lista" do
		it "# Existe un método para insertar valores en la lista por la cabeza" do
			expect(@list).to respond_to(:insert_head)
		end
		
		it "# Se inserta correctamente un nodo en el head" do 
			expect(@list.insert_head(@pollo)).to eq(@list.head)
			expect(@list.head.value.name).to eq("Pollo")
			expect(@list.head.next).to eq(nil)
			expect(@list.head.prev.value.name).to eq("Carne de Vaca")
		end

		it "# Existe un método para insertar valores en la lista por la cola" do 
			expect(@list).to respond_to(:insert_tail)
		end

		it "# Se inserta correctamente un nodo por la cola" do
			expect(@list.insert_tail(@cerdo)).to eq(@list.tail)
			expect(@list.tail.value.name).to eq("Cerdo")
			expect(@list.tail.prev).to eq(nil)
			expect(@list.tail.next.value.name).to eq("Carne de Vaca")
		end
		
		it "# Existe un método para insertar varios valores en la lista" do
			expect(@list).to respond_to(:insert)
		end

		it "# Se insertan correctamente un conjunto de nodos" do
			expect(@list.insert([@tofu,@lentejas,@cafe,@chocolate])).to eq(4)
		end 
	end
	
	context "# Extraer en la lista" do
		it "# Existe un método para extraer valores en la lista por la cabeza" do
			expect(@list).to respond_to(:extract_head)
		end

            	it "# Se extrae correctamente un elemento por la cabeza" do
                        head = @list.head
                        prev_head = @list.head.prev
                        expect((@list.extract_head()).value.name).to eq(head.value.name)
                        expect(@list.head.value.name).to eq(prev_head.value.name)
                end
		
		it "# Existe un método para extraer valores en la lista por la cola" do
			expect(@list).to respond_to(:extract_tail)
		end

		it "# Se extrae correctamente un elemento por la cola" do
			tail = @list.tail
			next_tail = @list.tail.next
			expect((@list.extract_tail()).value.name).to eq(tail.value.name)
			expect(@list.tail.value.name).to eq(next_tail.value.name)
		end
	end
	
	context "# Dieta Española" do
		it "# Se calcula correctamente la media de gases de la dieta española" do
			expect(@menu.list_environmental_impact(@española)).to eq(44.6)
		end

		it "# Se calcula correctamente la media de gases de la dieta española para un año" do
			expect(@menu.list_environmental_impact_annual(@española)).to eq(16279)
		end	
		
		it "# Se calcula correctamente el uso del terreno de la dieta española" do
			expect(@menu.list_ground_use(@española)).to eq(214)
		end

		it "# Se calcula correctamente el uso del terreno de la dieta española para un año" do
			expect(@menu.list_ground_use_annual(@española)).to eq(78110)
		end

		it "# Se calcula correctamente la media de gases de la dieta española con cantidades" do 
			expect(@menu.list_amount_environmental_impact(@española_complex, @cantidad_española)).to eq(44.6)
		end
		
		it "# Se calcula correctamente la media de gases de la dieta española con cantidades para un año" do
			expect(@menu.list_amount_environmental_impact_annual(@española_complex, @cantidad_española)).to eq(16279)
		end

		it "# Se calcula correctamente el uso del terreno de la dieta española con cantidades" do
			expect(@menu.list_amount_ground_use(@española_complex, @cantidad_española)).to eq(214)
		end

		it "# Se calcula correctamente el uso del terreno de la dieta española con cantidades para un año" do
			expect(@menu.list_amount_ground_use_annual(@española_complex, @cantidad_española)).to eq(78110)
		end
	end
	
	context "# Dieta Vasca" do
                it "# Se calcula correctamente la media de gases de la dieta vasca" do
                        expect(@menu.list_environmental_impact(@vasca)).to eq(11.5)
                end

                it "# Se calcula correctamente la media de gases de la dieta vasca para un año" do
                        expect(@menu.list_environmental_impact_annual(@vasca)).to eq(4197.5)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vasca" do
                        expect(@menu.list_ground_use(@vasca)).to eq(30.2)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vasca para un año" do
                        expect(@menu.list_ground_use_annual(@vasca)).to eq(11023)
                end

                it "# Se calcula correctamente la media de gases de la dieta vasca con cantidades" do
                        expect(@menu.list_amount_environmental_impact(@vasca_complex, @cantidad_vasca)).to eq(11.5)
                end

                it "# Se calcula correctamente la media de gases de la dieta vasca con cantidades para un año" do
                        expect(@menu.list_amount_environmental_impact_annual(@vasca_complex, @cantidad_vasca)).to eq(4197.5)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vasca con cantidades" do
                        expect(@menu.list_amount_ground_use(@vasca_complex, @cantidad_vasca)).to eq(30.2)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vasca con cantidades para un año" do
                        expect(@menu.list_amount_ground_use_annual(@vasca_complex, @cantidad_vasca)).to eq(11023)
                end
        end

	context "# Dieta Vegetaria" do
                it "# Se calcula correctamente la media de gases de la dieta vegetaria" do
                        expect(@menu.list_environmental_impact(@vegetaria)).to eq(33.8)
                end

                it "# Se calcula correctamente la media de gases de la dieta vegetaria para un año" do
                        expect(@menu.list_environmental_impact_annual(@vegetaria)).to eq(12337)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vegetaria" do
                        expect(@menu.list_ground_use(@vegetaria)).to eq(115.7)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vegetaria para un año" do
                        expect(@menu.list_ground_use_annual(@vegetaria)).to eq(42230.5)
                end

                it "# Se calcula correctamente la media de gases de la dieta vegetaria con cantidades" do
                        expect(@menu.list_amount_environmental_impact(@vegetaria_complex, @cantidad_vegetaria)).to eq(28.3)
                end

                it "# Se calcula correctamente la media de gases de la dieta vegetaria con cantidades para un año" do
                        expect(@menu.list_amount_environmental_impact_annual(@vegetaria_complex, @cantidad_vegetaria)).to eq(10329.5)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vegetaria con cantidades" do
                        expect(@menu.list_amount_ground_use(@vegetaria_complex, @cantidad_vegetaria)).to eq(95.2)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vegetaria con cantidades para un año" do
                        expect(@menu.list_amount_ground_use_annual(@vegetaria_complex, @cantidad_vegetaria)).to eq(34748)
                end
        end

	context "# Dieta Vegetaliana" do
                it "# Se calcula correctamente la media de gases de la dieta vegetaliana" do
                        expect(@menu.list_environmental_impact(@vegetaliana)).to eq(3.5)
                end

                it "# Se calcula correctamente la media de gases de la dieta vegetaliana para un año" do
                        expect(@menu.list_environmental_impact_annual(@vegetaliana)).to eq(1277.5)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vegetaliana" do
                        expect(@menu.list_ground_use(@vegetaliana)).to eq(20.3)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vegetaliana para un año" do
                        expect(@menu.list_ground_use_annual(@vegetaliana)).to eq(7409.5)
                end

                it "# Se calcula correctamente la media de gases de la dieta vegetaliana con cantidades" do
                        expect(@menu.list_amount_environmental_impact(@vegetaliana_complex, @cantidad_vegetaliana)).to eq(3.5)
                end

                it "# Se calcula correctamente la media de gases de la dieta vegetaliana con cantidades para un año" do
                        expect(@menu.list_amount_environmental_impact_annual(@vegetaliana_complex, @cantidad_vegetaliana)).to eq(1277.5)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vegetaliana con cantidades" do
                        expect(@menu.list_amount_ground_use(@vegetaliana_complex, @cantidad_vegetaliana)).to eq(20.3)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta vegetaliana con cantidades para un año" do
                        expect(@menu.list_amount_ground_use_annual(@vegetaliana_complex, @cantidad_vegetaliana)).to eq(7409.5)
                end
        end

	context "# Dieta Locura por la Carne" do
                it "# Se calcula correctamente la media de gases de la dieta locura por la carne" do
                        expect(@menu.list_environmental_impact(@locura_carne)).to eq(78.7)
                end

                it "# Se calcula correctamente la media de gases de la dieta locura por la carne para un año" do
                        expect(@menu.list_environmental_impact_annual(@locura_carne)).to eq(28725.5)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta locura por la carne" do
                        expect(@menu.list_ground_use(@locura_carne)).to eq(211.1)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta locura por la carne para un año" do
                        expect(@menu.list_ground_use_annual(@locura_carne)).to eq(77051.5)
                end

                it "# Se calcula correctamente la media de gases de la dieta locura por la carne con cantidades" do
                        expect(@menu.list_amount_environmental_impact(@locura_carne_complex, @cantidad_locura_carne)).to eq(78.7)
                end

                it "# Se calcula correctamente la media de gases de la dieta locura por la carne con cantidades para un año" do
                        expect(@menu.list_amount_environmental_impact_annual(@locura_carne_complex, @cantidad_locura_carne)).to eq(28725.5)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta locura por la carne con cantidades" do
                        expect(@menu.list_amount_ground_use(@locura_carne_complex, @cantidad_locura_carne)).to eq(211.1)
                end

                it "# Se calcula correctamente el uso del terreno de la dieta locura por la carne con cantidades para un año" do
                        expect(@menu.list_amount_ground_use_annual(@locura_carne_complex, @cantidad_locura_carne)).to eq(77051.5)
                end
	end

	context "# Comparar la información nutricional y ambiental entre dos alimentos" do
		it "# Se compara correctamente el aporte calórico de un alimento con otro usando <" do
			expect(@carne_vaca < @carne_cordero).to eq(true)
		end

		it "# Se compara correctamente el aporte calórico de un alimento con otro usando >" do
			expect(@carne_vaca > @carne_cordero).to eq(false)
		end

		it "# Se compara correctamente el aporte calórico de un alimento con otro usando ==" do
			expect(@carne_vaca == @carne_cordero).to eq(false)
		end

		it "# Se compara correctamente el aporte calórico de un alimento con otro usando <=" do 
			expect(@carne_vaca <= @carne_cordero).to eq(true)
		end

		it "# Se compara correctamente el aporte calórico de un alimento con otro usando >=" do
			expect(@carne_vaca >= @carne_cordero).to eq(false)
		end

		it "# Se compara correctamente si el aporte calórico de un alimentro está en un rango con between?()" do
			expect(@carne_vaca.between?(@tofu, @carne_cordero)).to eq(true)
		end

		it "# Se compara correctamente la información ambiental de un alimento con otro usando <" do
			expect(@carne_vaca.gei < @carne_cordero.gei).to eq(false)
		end

		it "# Se compara correctamente la información ambiental de un alimento con otro usando >" do
			expect(@carne_vaca.gei > @carne_cordero.gei).to eq(true)
		end

		it "# Se compara correctamente la información ambiental de un alimento con otro usando ==" do
			expect(@carne_vaca.gei == @carne_cordero.gei).to eq(false)
		end

		it "# Se compara correctamente la información ambiental de un alimento con otro usando <=" do 
			expect(@carne_vaca.gei <= @carne_cordero.gei).to eq(false)
		end

		it "# Se compara correctamente la información ambiental de un alimento con otro usando >=" do
			expect(@carne_vaca.gei >= @carne_cordero.gei).to eq(true)
		end

		it "# Se compara correctamente si la información ambiental de un alimentro está en un rango con between?()" do
			expect(@carne_vaca.gei.between?(@tofu.gei, @carne_cordero.gei)).to eq(false)
		end

		it "# Se compara correctamente el uso del terreno de un alimento con otro usando <" do
			expect(@carne_vaca.ground < @carne_cordero.ground).to eq(true)
		end

		it "# Se compara correctamente el uso del terreno de un alimento con otro usando >" do
			expect(@carne_vaca.ground > @carne_cordero.ground).to eq(false)
		end

		it "# Se compara correctamente el uso del terreno de un alimento con otro usando ==" do
			expect(@carne_vaca.ground == @carne_cordero.ground).to eq(false)
		end

		it "# Se compara correctamente el uso del terreno de un alimento con otro usando <=" do 
			expect(@carne_vaca.ground <= @carne_cordero.ground).to eq(true)
		end

		it "# Se compara correctamente el uso del terreno de un alimento con otro usando >=" do
			expect(@carne_vaca.ground >= @carne_cordero.ground).to eq(false)
		end

		it "# Se compara correctamente si el uso del terreno de un alimentro está en un rango con between?()" do
			expect(@carne_vaca.ground.between?(@tofu.ground, @carne_cordero.ground)).to eq(true)
		end

		it "# Se compara correctamente las proteinas de un alimento con otro usando <" do
			expect(@carne_vaca.proteins < @carne_cordero.proteins).to eq(false)
		end

		it "# Se compara correctamente las proteinas de un alimento con otro usando >" do
			expect(@carne_vaca.proteins > @carne_cordero.proteins).to eq(true)
		end

		it "# Se compara correctamente las proteinas de un alimento con otro usando ==" do
			expect(@carne_vaca.proteins == @carne_cordero.proteins).to eq(false)
		end

		it "# Se compara correctamente las proteinas de un alimento con otro usando <=" do 
			expect(@carne_vaca.proteins <= @carne_cordero.proteins).to eq(false)
		end

		it "# Se compara correctamente las proteinas de un alimento con otro usando >=" do
			expect(@carne_vaca.proteins >= @carne_cordero.proteins).to eq(true)
		end

		it "# Se compara correctamente si las proteinas de un alimentro está en un rango con between?()" do
			expect(@carne_vaca.proteins.between?(@tofu.proteins, @carne_cordero.proteins)).to eq(false)
		end

		it "# Se compara correctamente los carbohidratos de un alimento con otro usando <" do
			expect(@carne_vaca.carbohydrates < @carne_cordero.carbohydrates).to eq(false)
		end

		it "# Se compara correctamente los carbohidratos de un alimento con otro usando >" do
			expect(@carne_vaca.carbohydrates > @carne_cordero.carbohydrates).to eq(false)
		end

		it "# Se compara correctamente los carbohidratos de un alimento con otro usando ==" do
			expect(@carne_vaca.carbohydrates == @carne_cordero.carbohydrates).to eq(true)
		end

		it "# Se compara correctamente los carbohidratos de un alimento con otro usando <=" do 
			expect(@carne_vaca.carbohydrates <= @carne_cordero.carbohydrates).to eq(true)
		end

		it "# Se compara correctamente los carbohidratos de un alimento con otro usando >=" do
			expect(@carne_vaca.carbohydrates >= @carne_cordero.carbohydrates).to eq(true)
		end

		it "# Se compara correctamente si los carbohidratos de un alimentro está en un rango con between?()" do
			expect(@carne_vaca.carbohydrates.between?(@carne_cordero.carbohydrates, @tofu.carbohydrates)).to eq(true)
		end

		it "# Se compara correctamente los lipidos de un alimento con otro usando <" do
			expect(@carne_vaca.lipids < @carne_cordero.lipids).to eq(true)
		end

		it "# Se compara correctamente los lipidos de un alimento con otro usando >" do
			expect(@carne_vaca.lipids > @carne_cordero.lipids).to eq(false)
		end

		it "# Se compara correctamente los lipidos de un alimento con otro usando ==" do
			expect(@carne_vaca.lipids == @carne_cordero.lipids).to eq(false)
		end

		it "# Se compara correctamente los lipidos de un alimento con otro usando <=" do 
			expect(@carne_vaca.lipids <= @carne_cordero.lipids).to eq(true)
		end

		it "# Se compara correctamente los lipidos de un alimento con otro usando >=" do
			expect(@carne_vaca.lipids >= @carne_cordero.lipids).to eq(false)
		end

		it "# Se compara correctamente si los lipidos de un alimentro está en un rango con between?()" do
			expect(@carne_vaca.lipids.between?(@tofu.lipids, @carne_cordero.lipids)).to eq(false)
		end
	end

	context "# Enumerar listas de alimentos con collect, select, max, min y sort" do
		it "# Se ejecuta correctamente el método collect sobre una lista" do
			expect(@española.collect { |val| val.value.proteins > 10}).to eq([true, true, true, false, false, true, true])
		end

		it "# Se ejecuta correctamente el método max sobre una lista" do
			expect((@española.max { |a, b| a.value.energetic_value_complex(a.value.proteins, a.value.carbohydrates, a.value.lipids) <=> b.value.energetic_value_complex(b.value.proteins, b.value.carbohydrates, b.value.lipids)}).value).to eq(@nuez)
		end

		it "# Se ejecuta correctamente el método min sobre una lista" do
			expect((@española.min { |a, b| a.value.energetic_value_complex(a.value.proteins, a.value.carbohydrates, a.value.lipids) <=> b.value.energetic_value_complex(b.value.proteins, b.value.carbohydrates, b.value.lipids)}).value).to eq(@leche_vaca)
		end

		it "# Se ejecuta correctamente el método sort sobre una lista" do
			array = @española.sort { |a, b| a.value.energetic_value_complex(a.value.proteins, a.value.carbohydrates, a.value.lipids) <=> b.value.energetic_value_complex(b.value.proteins, b.value.carbohydrates, b.value.lipids)}
			array_value = []
			array.each { |val| array_value.push(val.value) }
			expect(array_value).to eq([@leche_vaca, @camarones, @carne_cordero, @lentejas, @lentejas, @chocolate, @nuez])
		end

		it "# Se ejecuta correctamente el método select sobre una lista" do
			array = @española.select { |val| val.value.energetic_value_complex(val.value.proteins, val.value.carbohydrates, val.value.lipids) > 400}
			array_value = []
			array.each { |val| array_value.push(val.value) }
			expect(array_value).to eq([@chocolate, @nuez])
		end
	end

	context "Platos" do
		it "# Existe un método para obtener el nombre de un plato" do
			expect(@plate).to respond_to(:name)
		end

		it "# Se obtiene correctamente el nombre de un plato" do
			expect(@plate.name).to eq("Prueba")
		end

		it "# Existe un método para obtener el conjunto de alimentos de un plato" do
			expect(@plate).to respond_to(:food)
		end

		it "# Se obtiene correctamente el conjunto de alimentos de un plato" do
			expect(@plate.food).to eq(@española_complex)
		end

		it "# Existe un método para obtener el conjunto de gramos de los alimentos de un plato" do
			expect(@plate).to respond_to(:food_gr)
		end

		it "# Se obtiene correctamente el conjunto de gramos de los alimentos de un plato" do
			expect(@plate.food_gr).to eq(@cantidadGR_española)
		end

		it "# Se obtiene correctamente el porcentaje de proteínas del conjunto de alimentos" do
			expect(@plate.percentage_proteins()).to eq(20.92)
		end

		it "# Se obtiene correctamente el porcentaje de carbohidratos del conjunto de alimentos" do
			expect(@plate.percentage_carbohydrates()).to eq(33.54)
		end

		it "# Se obtiene correctamente el porcentaje de lípidos del conjunto de alimentos" do
			expect(@plate.percentage_lipids()).to eq(45.54)
		end

		it "# Se obtiene correctamente el valor calórico total del conjunto de alimentos" do
			expect(@plate.VCT()).to eq(2126.4)
		end

		it "# Se obtiene correctamente el plato formateado" do
			expect(@plate.to_s).to eq("Nombre: Prueba, Alimentos: 200 gr Lentejas, 100 gr Camarones, 100 gr Chocolate, 100 gr Leche de Vaca, 100 gr Nuez, 100 gr Carne de Cordero")
		end
	end

	context "# Herencia" do
		it "# Se obtiene correctamente el co2 del plato" do
			expect(@plate_ambiental.co2).to eq(44.6)
		end
	end
end
