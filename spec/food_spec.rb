require 'food'

RSpec.describe Food do
	
	before :all do
		@carne_vaca = Food.new("Carne de Vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
	end

	describe "# Nombre del Alimento" do

		it "# Existe un método para obtener el nombre del alimento" do
			expect(@carne_vaca).to respond_to(:name)
		end
	end
end
