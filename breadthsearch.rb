class BreadthSearch

  def initialize(initial_node)
    @initial_node = initial_node
    @visited = []
    @bridge = {}

    breadth_first_search(initial_node)
  end

  def shortest_path(input_node)
    return unless @visited.include?(input_node)
    path = []

    while(input_node != @initial_node) do
      path.unshift(input_node)
      input_node = @bridge[input_node]
    end

    path.unshift(@initial_node)
  end

  def breadth_first_search(input_node)
    list = []
    list << input_node
    @visited << input_node
    while list.any?
      present_node = list.shift
      present_node.edges.each do |next_node|
        next if @visited.include?(next_node)
        list << next_node
        @visited << next_node
        @bridge[next_node] = present_node
      end
    end
  end

end