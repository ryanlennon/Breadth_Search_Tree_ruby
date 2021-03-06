require_relative "importfile.rb"
require_relative "node.rb"
require_relative "breadthsearch.rb"

class Tree
  
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
    @queries_storage_array.each do |queries|
      if queries[0] === "add"
        add_nodes(queries)
      else
        find_max(queries)
      end
    end
  end

  def self.tree_traversal(input_node, node_path)
    nodes_visited = [input_node]
    list = []
    list << input_node
    while list.any?
      current_node = list.shift
      current_node.edges.each do |edge|
        next if nodes_visited.include?(edge) || node_path.include?(edge)
        list << edge
        nodes_visited << edge
      end
    end
    nodes_visited
  end

  def self.connected_nodes(node_number)
    @nodes_storage_array.select { |storage_array| storage_array.include?(node_number) }
  end

  def self.find_node(number)
    @tree_node_array.find {|tree_node| tree_node.number == number }
  end

  def self.add_nodes(input_node_array)
    tree_path = []
    if input_node_array[1].to_i === 1
      @tree_node_array.each do |tree_node|
        tree_node.value += input_node_array[2].to_i
      end
    else
      start_node = find_node(input_node_array[1])
      bf_search = BreadthSearch.new(start_node)
      quickest_path = bf_search.shortest_path(find_node("1"))
      tree_path << tree_traversal(start_node, quickest_path)
      tree_path.flatten.each do |path|
        path.value += input_node_array[2].to_i
      end
    end
  end

  def self.find_max(input_nodes)
    start_node = find_node(input_nodes[1])
    end_node = find_node(input_nodes[2])
    node_values = []
    bf_search = BreadthSearch.new(start_node)
    tree_path = bf_search.shortest_path(end_node)
    tree_path.each do |path|
      node_values << path.value
    end
    p node_values.max
  end

  def self.final_output(file_data)
    @tree_data = NewFile.open_file(file_data)
    input_split
    build_tree
  end
end