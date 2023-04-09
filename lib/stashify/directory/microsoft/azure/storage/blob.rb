# frozen_string_literal: true

require "stashify/directory"

require "stashify/file/microsoft/azure/storage/blob"

module Stashify
  class Directory
    module Microsoft
      module Azure
        module Storage
          # An implementation for interacting with Azure Blob Storage
          # as if they had directories with "/" as a path
          # separator. In addition to a path, it also needs a
          # Azure::Storage::Blob::BlobService and
          # Azure::Storage::Blob::Container::Container objects
          # representing the container the file resides within.
          class Blob < Stashify::Directory
            attr_reader :container

            def initialize(client:, container:, path:)
              @client = client
              @container = container
              super(path: path)
            end

            def parent
              Stashify::Directory::Microsoft::Azure::Storage::Blob.new(
                client: @client,
                container: @container,
                path: ::File.dirname(path),
              )
            end

            def files
              blobs.map do |blob|
                Stashify::File::Microsoft::Azure::Storage::Blob.new(
                  client: @client,
                  container: @container,
                  path: path_of(blob.name),
                )
              end
            end

            def blobs
              @client.list_blobs(
                @container.name,
                prefix: path_of(""),
                delimiter: "/",
              )
            end

            def directory?(name)
              !@client.list_blobs(
                @container.name,
                prefix: path_of(name, ""),
                delimiter: "/",
              ).empty?
            end

            def directory(name)
              Stashify::Directory::Microsoft::Azure::Storage::Blob.new(
                client: @client,
                container: @container,
                path: ::File.join(path, name),
              )
            end

            def exists?(name)
              file(name).exists?
            end

            def file(name)
              Stashify::File::Microsoft::Azure::Storage::Blob.new(
                client: @client,
                container: @container,
                path: path_of(name),
              )
            end

            def ==(other)
              self.class == other.class && @container == other.container && path == other.path
            end
          end
        end
      end
    end
  end
end
