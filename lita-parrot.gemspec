Gem::Specification.new do |spec|
  spec.name          = "lita-parrot"
  spec.version       = "0.1.0"
  spec.authors       = ["Loïc Delmaire & Jérémie Fortin"]
  spec.email         = ["loic@hellojam.fr", "jeremie.fortin@sciencespo.fr"]
  spec.description   = ':parrot: parrot everywhere :parrot:'
  spec.summary       = ':parrot: parrot everywhere :parrot:'
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rack", "< 2.0"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
end
