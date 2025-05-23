require_relative 'lib/sniper_links/version'

Gem::Specification.new do |spec|
  spec.name    = "sniper_links"
  spec.version = SniperLinks::VERSION
  spec.authors = ["Gabriel Fortuna"]
  spec.email   = ["gabriel@zero-one.io"]

  spec.summary               = "Generate sniper links for various email platforms"
  spec.description           = "Increase your email open rates with sniper links. This gem generates sniper links for various email platforms, increasing the chance that an email will be acted on."
  spec.homepage              = "https://www.zero-one.io"
  spec.license               = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["source_code_uri"]   = "https://github.com/zero-one-software/sniper-links"
  spec.metadata["changelog_uri"]     = "https://github.com/zero-one-software/sniper-links/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
