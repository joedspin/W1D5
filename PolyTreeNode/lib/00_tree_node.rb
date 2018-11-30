class PolyTreeNode
  attr_accessor :value, :children
  attr_reader :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node.nil?
        @parent = nil
    else    
        if self.parent
            self.parent.children.reject! { |child| child == self }
        end
        @parent = node
        node.children << self unless node.children.include?(self)
    end
  end

  def add_child(child)
    child.parent = self
   end

   def remove_child(child)
     raise "not a valid child" if child.parent != self
     child.parent = nil      
   end

end

