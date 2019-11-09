require 'food'

RSpec.describe Food do
	
	before :all do
		@carne_vaca = Food::Food.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
	end

	describe "# Nombre del Alimento" do

		it "# Existe un método para obtener el nombre del alimento" do
			expect(@carne_vaca).to respond_to(:name)
		end

		it "# Se almacena correctamente el nombre de un alimento" do
			expect(@carne_vaca.name).to eq("Carne de Vaca")
		end
	end

	describe "# Atributo Proteins" do 
		
		it "# Existe el atributo proteins" do
			expect(@carne_vaca).to respond_to(:proteins)
		end

		it "# Se almacena correctamente el valor de las proteinas" do
			expect(@carne_vaca.proteins).to eq(21.1)
		end
	end

	describe "# Atributo Carbohydrates" do
	
		it "# Existe el atributo carbohydrates" do
			expect(@carne_vaca).to respond_to(:carbohydrates)
		end
		
		it "# Se almacena correctamente el valor de las proteinas" do
			expect(@carne_vaca.carbohydrates).to eq(0.0)
		end

	end

	describe "# Atributo Lipids" do

                it "# Existe el atributo lipids" do
                        expect(@carne_vaca).to respond_to(:lipids)
                end

                it "# Se almacena correctamente el valor de los lipidos" do
                        expect(@carne_vaca.lipids).to eq(3.1)
                end

        end

	describe "# Atributo GEI" do

                it "# Existe el atributo gei" do
                        expect(@carne_vaca).to respond_to(:gei)
                end

                it "# Se almacena correctamente el valor de GEI" do
                        expect(@carne_vaca.gei).to eq(50.0)
                end

        end

	describe "# Atributo Ground" do

                it "# Existe el atributo ground" do
                        expect(@carne_vaca).to respond_to(:ground)
                end

                it "# Se almacena correctamente el valor de ground" do
                        expect(@carne_vaca.ground).to eq(164.0)
                end

        end

	describe "# Alimento Formateado" do
		
		it "# Existe un método para formatear el alimento" do
			expect(@carne_vaca).to respond_to(:to_s)
		end

		it "# Se formatea correctamente el alimento" do
			expect(@carne_vaca.to_s).to eq("#{@carne_vaca.name}: #{@carne_vaca.proteins} g Proteins | #{@carne_vaca.carbohydrates} g Carbohydrates | #{@carne_vaca.lipids} g Lipids | #{@carne_vaca.gei} kgCO2eq GEI | #{@carne_vaca.ground} m2año Ground")
		end
	end

	describe "# Kcal generadas por los macronutrientes" do
		
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

	describe "# Valor energético de un alimento" do
		
		it "# Cálculo correcto del valor energético de un alimento. Método complejo" do
			expect(@carne_vaca.energetic_value_complex(@carne_vaca.proteins, @carne_vaca.carbohydrates, @carne_vaca.lipids)).to eq(112.3)
		end

		it "# Cálculo correcto del valor energético de un alimento. Método simple" do 
			expect(@carne_vaca.energetic_value_simple(@carne_vaca.kcal_proteins(@carne_vaca.proteins), @carne_vaca.kcal_carbohydrates(@carne_vaca.carbohydrates), @carne_vaca.kcal_lipids(@carne_vaca.lipids))).to eq(112.3)
		end
	end
end
