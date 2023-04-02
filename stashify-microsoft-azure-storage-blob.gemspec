# frozen_string_literal: true

require_relative "lib/stashify/microsoft/azure/storage/blob/version"

Gem::Specification.new do |spec|
  spec.name = "stashify-microsoft-azure-storage-blob"
  spec.version = Stashify::Microsoft::Azure::Storage::Blob::VERSION
  spec.authors = ["Lambda Null"]
  spec.email = ["lambda.null.42@gmail.com"]

  spec.summary = "An implementation of the Stashify abstraction for Azure's Blob Storage"
  spec.description = "Interact with Azure Blob Storage using the common building blocks provided by Stashify"
  spec.homepage = "https://github.com/Lambda-Null/stashify-microsoft-azure-storage-blob"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "azure-storage-blob", "~> 2.0.3"
  spec.add_dependency "stashify", "~> 3.1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
