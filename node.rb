require 'set'
#Using Set avoids duplications of 
#node connecions that may 
#otherwise occur while using Array.
class Node
  attr_accessor :number, :edges, :value

  def initialize(number)
    @value = 0
    @number = number
    @edges = Set.new 
  end

end