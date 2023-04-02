# frozen_string_literal: true

require "stashify/contract/directory_contract"

require "stashify/directory/microsoft/azure/storage/blob"

RSpec.describe Stashify::Directory::Microsoft::Azure::Storage::Blob do
  around(:each) do |s|
    SpecHelper.temp_container do |client, container|
      @client = client
      @container = container
      s.run
    end
  end

  include_context "directory setup", 10

  before(:each) do
    @client.create_block_blob(@container.name, File.join(path, file_name), contents)
  end

  subject(:directory) do
    Stashify::Directory::Microsoft::Azure::Storage::Blob.new(
      client: @client,
      container: @container,
      path: path,
    )
  end

  it_behaves_like "a directory"
end
