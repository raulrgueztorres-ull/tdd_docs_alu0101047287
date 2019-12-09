# Require del fichero con la versión.
require "food/version"
# Require del fichero con la clase Food.
require "food/food"
# Require del fichero con la clase List.
require "food/list"
# Require del fichero con la clase Plate.
require "food/plate"
# Require del fichero con la clase PlateAmbiental.
require "food/plateAmbiental"
# Require del fichero con la clase Array.
require "food/array"

module Food
  # Clase Error. Esta clase se emplea para los errores del código. Por defecto hereda de StandardError.
  class Error < StandardError; end
  # Your code goes here...
end
