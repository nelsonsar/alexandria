require 'open-uri'
require 'readability'

module Alexandria
  class Downloader
    def download(url)
      source = open(url).read

      readability_options = {
        :remove_empty_nodes => true,
        :ignore_image_format => ['png', 'gif', 'jpg', 'jpeg'],
        :tags => %w[div p a h1 h2 h3 h4 h5]
      }

      Readability::Document.new(source, readability_options).content
    end
  end
end
