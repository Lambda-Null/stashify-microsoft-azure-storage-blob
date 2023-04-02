# frozen_string_literal: true

require "stashify/contract/file_contract"

require "stashify/file/microsoft/azure/storage/blob"

RSpec.describe Stashify::File::Microsoft::Azure::Storage::Blob do
  around(:each) do |s|
    SpecHelper.temp_container do |client, container|
      @client = client
      @container = container
      s.run
    end
  end

  include_context "file setup", 10

  before(:each) do
    @client.create_block_blob(@container.name, path, contents)
  end

  subject(:file) do
    Stashify::File::Microsoft::Azure::Storage::Blob.new(
      client: @client,
      container: @container,
      path: path,
    )
  end

  it_behaves_like "a file"
end
