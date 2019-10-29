
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "website_worth/version"

Gem::Specification.new do |spec|
  spec.name          = "website_worth"
  spec.version       = WebsiteWorth::VERSION
  spec.authors       = ["'Naya Willis'"]
  spec.email         = ["'greedybrain18@gmail.com'"]

  spec.summary       = %q{"Website revenue and its' traffic data at your disposal"}
  spec.description   = %q{"This gem allows a user to get revenue and traffic data from a particular website"}
  spec.homepage      = "https://github.com/greedybrain/website_worth.git"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables << 'website_worth'
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
