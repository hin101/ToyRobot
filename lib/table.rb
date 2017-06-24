class Table
  attr_accessor :position

  def initialize(height =  5, width =  5)
    @height = height
    @width = width
  end

  def place(x_pos, y_pos)
    self.position = { x: x_pos, y: y_pos } if valid_coordinates?(x_pos, y_pos)
  end

  def robot_placed?
    position != nil
  end

  private

  def valid_coordinates?(x, y)
    ((0..@width - 1).cover?(x) && (0..@height - 1).cover?(y))
  end
end
