class Tree
  
  def self.output(file_data)
    @tree_data = NewFile.open_file(file_data)
    input_split
    build_tree
    read_queries
  end

  def self.input_split
    @nodes_storage_array = []
    @queries_storage_array = []
    @total_nodes = @tree_data.shift

    @tree_data.each do |data|
      data_array = data.split
      if data_array.length < 3
        @nodes_storage_array << data_array 
      else
        @queries_storage_array << data_array  
      end
    end
    @query_number = @nodes_storage_array.pop
    p @nodes_storage_array
    @queries_storage_array
  end