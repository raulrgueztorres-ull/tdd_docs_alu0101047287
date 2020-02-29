lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "food/version"

Gem::Specification.new do |spec|
  spec.name          = "food"
  spec.version       = Food::VERSION
  spec.authors       = ["Raul Rodriguez Torres"]
  spec.email         = ["alu0101047287@ull.edu.es"]

  spec.summary       = %q{Clase y pruebas creadas con TDD para el cálculo del impácto ambiental de un menú dados un conjunto de alimentos en unas cantidades específicas}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end
