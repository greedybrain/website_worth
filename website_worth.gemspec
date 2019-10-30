
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./lib/website_worth/version"

Gem::Specification.new do |spec|

  spec.name          = "website_worth"
  spec.version       = WebsiteWorth::VERSION
  spec.date          = "2019-10-29"
  spec.summary       = "Website revenue and its' traffic data at your disposal"
  spec.description   = "Get the latest estimated revenue and traffic data on any website."
  spec.authors       = ["'Naya Willis'"]
  spec.email         = ["'greedybrain18@gmail.com'"]
  spec.files         = ["lib/website_worth.rb", "lib/website_worth/cli.rb", "lib/website_worth/scraper.rb", "lib/website_worth/user.rb", "config/environment.rb"]
  spec.homepage      = "https://github.com/greedybrain/website_worth.git"
  spec.license       = "MIT"
  spec.executables << 'website_worth'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"

end

# Specify which files should be added to the gem when it is released.
# The `git ls-files -z` loads the files in the RubyGem that have been added into git.
# Dir.chdir(File.expand_path('..', __FILE__)) do
#   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
# end
# spec.bindir        = "bin"
# spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
# spec.require_paths = ["lib"]