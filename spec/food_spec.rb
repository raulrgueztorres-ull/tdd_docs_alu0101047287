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
end
