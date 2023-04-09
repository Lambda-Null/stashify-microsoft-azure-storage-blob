# frozen_string_literal: true

require "stashify/file"

module Stashify
  class File
    module Microsoft
      module Azure
        module Storage
          # An implementation for interacting with files in Azure Blob
          # Storage. The constructor needs an instance of
          # Azure::Storage::Blob::BlobService and
          # Azure::Storage::Blob::Container::Container in order to
          # know which bucket to interact with.
          class Blob < Stashify::File
            def initialize(client:, container:, path:)
              @client = client
              @container = container
              super(path: path)
            end

            def contents
              _, content = @client.get_blob(@container.name, path)
              content
            end

            def write(contents)
              @client.create_block_blob(@container.name, path, contents)
            end

            def exists?
              @client.get_blob(@container.name, path)
            rescue ::Azure::Core::Http::HTTPError => e
              raise unless e.status_code == 404
            end

            def delete
              @client.delete_blob(@container.name, path)
            end
          end
        end
      end
    end
  end
end
