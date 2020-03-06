# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require "flyway_migrator/identity"

Gem::Specification.new do |spec|
  spec.name = FlywayMigrator::Identity.name
  spec.version = FlywayMigrator::Identity.version
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["David Mkrtchyan"]
  spec.email = ["damkrtchyan@yahoo.com"]
  spec.homepage = ""
  spec.summary = ""
  spec.license = "MIT"

  if File.exist?(Gem.default_key_path) && File.exist?(Gem.default_cert_path)
    spec.signing_key = Gem.default_key_path
    spec.cert_chain = [Gem.default_cert_path]
  end

  spec.required_ruby_version = "~> 2.6"
  spec.add_dependency "runcom", "~> 1.3"
  spec.add_dependency "thor", "~> 0.20"
  spec.add_dependency "date", "~> 3.0"
  spec.add_dependency "OptionParser", "~> 0.5.1"
  spec.add_development_dependency "gemsmith", "~> 10.4"
  spec.add_development_dependency "git-cop", "~> 1.7"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-byebug", "~> 3.5"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "reek", "~> 4.7"
  spec.add_development_dependency "rspec", "~> 3.7"
  spec.add_development_dependency "rubocop", "~> 0.51"

  spec.files = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.executables << "flywayMigrator"
  spec.require_paths = ["lib"]
end
