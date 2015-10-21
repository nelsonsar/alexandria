class FilesystemHandler
  def create_dir(dir_name)
    Dir.mkdir dir_name
  end

  def create_file_with_content(file_name, content)
    file = File.new file_name, 'w+'
    file.puts content
  end
end
