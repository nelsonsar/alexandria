require "bundler"
Bundler.setup(:default)

module Alexandria
  class Indexer
    def initialize(downloader, filesystem_handler)
      @downloader = downloader
      @filesystem_handler = filesystem_handler
    end

    def index(name, tags, url)
      content = @downloader.download(url)

      tags.each do |dir|
        combined_dir = ALEXANDRIA_PATH + '/' + dir
        @filesystem_handler.create_dir combined_dir
      end

      @filesystem_handler.create_file_with_content name, content
    end
  end
end
