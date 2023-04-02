# frozen_string_literal: true

require "azure/storage/blob"
require "securerandom"

require "stashify/microsoft/azure/storage/blob"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

module SpecHelper
  def self.temp_container
    client = Azure::Storage::Blob::BlobService.create
    container = client.create_container(SecureRandom.uuid)
    yield(client, container)
  ensure
    client.delete_container(container.name)
  end
end
