
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "marky_markdown/version"

Gem::Specification.new do |spec|
  spec.name          = "marky_markdown"
  spec.version       = MarkyMarkdown::VERSION
  spec.authors       = ["Brian 'bdougie' Douglas"]
  spec.email         = ["ilikerobot@gmail.com"]

  spec.summary       = %q{Tranform your markdown with variable interpolation}
  spec.description   = %q{MarkyMarkdown add the ability to set variables in Markdown for interpolation}
  spec.homepage      = "https://github.com/bdougie/marky_markdown"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
