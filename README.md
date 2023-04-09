# Stashify::Microsoft::Azure::Storage::Blob

This is an implementation of the [Stashify](https://rubydoc.info/gems/stashify) abstraction for Azure Blob Storage. It operates under the assumption that the "/" in file names has the typical meaning of a path separater.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stashify-microsoft-azure-storage-blob'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install stashify-microsoft-azure-storage-blob

## Usage

This implementation is built expecting an instance of `Azure::Storage::Blob::BlobService` and `Azure::Storage::Blob::Container::Container`. The following usage is an abbreviated form to illustrate how to engage in this particular library. For a more extensive example see [Stashify's Usage](https://rubydoc.info/gems/stashify#usage).

```ruby
> require "azure/storage/blob"
=> true
> client = Azure::Storage::Blob::BlobService.create
=> 
#<Azure::Storage::Blob::BlobService:0x0000563aa41d14a8
> container = Azure::Storage::Blob::Container::Container.new
=> 
...
> container.name = "some-container"
...
> file = Stashify::File::Microsoft::Azure::Storage::Blob.new(client: client, 
container: container, path: "path/to/file")
=> 
#<Stashify::File::Microsoft::Azure::Storage::Blob:0x0000555afaadd6f8
...
> file.contents
=> "foo"
> require "stashify/directory/microsoft/azure/storage/blob"
=> true
> dir = Stashify::Directory::Microsoft::Azure::Storage::Blob.new(client: client, container: container, path: "path/to")
=> 
#<Stashify::Directory::Microsoft::Azure::Storage::Blob:0x0000555afa40c7c0
...
> dir.find("file") == file
=> true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/stashify-microsoft-azure-storage-blob. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/stashify-microsoft-azure-storage-blob/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Stashify::Microsoft::Azure::Storage::Blob project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/stashify-microsoft-azure-storage-blob/blob/main/CODE_OF_CONDUCT.md).
