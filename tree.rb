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

  def self.build_tree
    @tree_node_array = []
    individual_nodes = @nodes_storage_array.flatten.uniq
    individual_nodes.each do |node|
      tree_node = Node.new(node)
      @tree_node_array << tree_node 
    end
    @tree_node_array.each do |tree_node|
      edges = connected_nodes(tree_node.number).flatten.uniq
      edges.each { |edge| tree_node.edges << find_node(edge) }
    end