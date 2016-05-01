class NewFile
#imports a text file
  def self.open_file(file_input)
    file_data = []
    File.open(file_input, "r") do |file|
      file.each_line do |line|
        file_data << line
      end
    end
    file_data
  end

end