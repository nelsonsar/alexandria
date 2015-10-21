require "bundler/setup"
require './lib/alexandria/indexer'
require 'alexandria'
require 'minitest/autorun'
require 'mocha/mini_test'

class IndexerTest < MiniTest::Unit::TestCase

  def test_index
    index_name = 'foo'
    tags = ['csharp']
    url = 'https://msdn.microsoft.com/en-us/library/ms229060%28v=vs.110%29.aspx'
    content = "<p>foo content</p>"

    downloader = mock()
    filesystem_handler = mock()

    downloader.expects(:download).with(url).returns(content)
    filesystem_handler.expects(:create_dir).with(Alexandria::ALEXANDRIA_PATH + '/csharp').once
    filesystem_handler.expects(:create_file_with_content).with(index_name, content).once

    indexer = Alexandria::Indexer.new(downloader, filesystem_handler)

    indexer.index(index_name, tags, url)
  end

end

